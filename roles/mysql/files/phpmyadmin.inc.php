<?php

$cfg['Servers'][1]['auth_type'] = 'config';
$cfg['Servers'][1]['user'] = 'root';
$cfg['Servers'][1]['password'] = '';
$cfg['Servers'][1]['AllowNoPassword'] = true;

$cfg['Servers'][1]['hide_db'] = '^(information_schema|mysql|performance_schema|phpmyadmin)$';

$cfg['ShowDatabasesNavigationAsTree'] = false;
$cfg['NavigationDisplayLogo'] = false;
$cfg['NumRecentTables'] = 0;
$cfg['NumFavoriteTables'] = 0;

$cfg['MaxNavigationItems'] = 9999;
$cfg['NavigationTreeEnableExpansion'] = false;

$cfg['ShowAll'] = true;
$cfg['RetainQueryBox'] = true;
