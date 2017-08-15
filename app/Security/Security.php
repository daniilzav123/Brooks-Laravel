<?php

namespace App\Security;

use Illuminate\Http\Request;

class Security {
    public static function prepareRequest(Request $request)
    {
        $arguments = $request->all();
        
        if ($arguments['versionCode'] < 10)
            return null;


        $data = $arguments['data'];
        $mcrypt = new MCrypt();
        $data = $mcrypt->decrypt($data);
        $data = substr($data, 0, strrpos($data, '}') + 1);

        return json_decode($data, true);
    }
}

class MCrypt
{
    private $iv = 'Aladdin######Net'; #Same as in JAVA
    private $key = '___AladdinNet___'; #Same as in JAVA
    function __construct()
    {
    }
    /**
     * @param string $str
     * @param bool $isBinary whether to encrypt as binary or not. Default is: false
     * @return string Encrypted data
     */
    function encrypt($str, $isBinary = false)
    {
        $iv = $this->iv;
        $str = $isBinary ? $str : utf8_decode($str);
        $td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, $iv);
        mcrypt_generic_init($td, $this->key, $iv);
        $encrypted = mcrypt_generic($td, $str);
        mcrypt_generic_deinit($td);
        mcrypt_module_close($td);
        return $isBinary ? $encrypted : bin2hex($encrypted);
    }
    /**
     * @param string $code
     * @param bool $isBinary whether to decrypt as binary or not. Default is: false
     * @return string Decrypted data
     */
    function decrypt($code, $isBinary = false)
    {
        $code = $isBinary ? $code : $this->hex2bin($code);
        $iv = $this->iv;
        $td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, $iv);
        mcrypt_generic_init($td, $this->key, $iv);
        $decrypted = mdecrypt_generic($td, $code);
        mcrypt_generic_deinit($td);
        mcrypt_module_close($td);
//        return $isBinary ? trim($decrypted) : utf8_encode(trim($decrypted));
        return $decrypted;
    }
    protected function hex2bin($hexdata)
    {
        $bindata = '';
        for ($i = 0; $i < strlen($hexdata); $i += 2) {
            $bindata .= chr(hexdec(substr($hexdata, $i, 2)));
        }
        return $bindata;
    }
}