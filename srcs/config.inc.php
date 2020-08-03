<?php
/* vim: set expandtab sw=4 ts=4 sts=4: */

declare(strict_types=1);

/**
 * This is needed for cookie based authentication to encrypt password in
 * cookie. Needs to be 32 chars long.
 */
$cfg['blowfish_secret'] = 'KLS$vbc91Lkja$vc@opGbxA278EWopdc';

/* Authentication type */
$cfg['Servers'][1]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][1]['host'] = 'localhost';
$cfg['Servers'][1]['compress'] = false;
$cfg['Servers'][1]['AllowNoPassword'] = true;

/**
 * End of servers configuration
 */

/**
 * Directories for saving/loading files from server
 */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';


/**
 * Disallow editing of binary fields
 * valid values are:
 *   false    allow editing
 *   'blob'   allow editing except for BLOB fields
 *   'noblob' disallow editing except for BLOB fields
 *   'all'    disallow editing
 * default = 'blob'
 */
//$cfg['ProtectBinary'] = false;

$cfg['DefaultLang'] = 'en';

$cfg['SendErrorReports'] = 'always';
$cfg['ThemeDefault'] = 'fallen';
?>