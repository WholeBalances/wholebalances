/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.0 		*/
/*  Created On : 03-���-2016 7:50:04 				*/
/*  DBMS       : SQLite 								*/
/* ---------------------------------------------------- */

DROP TABLE IF EXISTS 'Requests'
;

DROP TABLE IF EXISTS 'dicInsideAccountPosition'
;

DROP TABLE IF EXISTS 'dicBalanceAccounts'
;

DROP TABLE IF EXISTS 'BalanceInfo'
;

DROP TABLE IF EXISTS 'ApplicationAccount'
;

-- ���������� �� �������� ���������� �� ������
CREATE TABLE 'Requests'
(
	'ID' INTEGER NOT NULL PRIMARY KEY,
	'RequestDate' TEXT NOT NULL, -- ���� �������
	'Status' INTEGER NOT NULL, -- ������ �������
	'BalanceAccountId' INTEGER NOT NULL -- ����������������� ����� �����, ��� �������� ���������� ������
)
;

-- ���������� ��������� ������� �����
CREATE TABLE 'dicInsideAccountPosition'
(
	'ID' INTEGER NOT NULL PRIMARY KEY, -- !!! ���� �� ����������������� ����� ���������� ��������� ������� ����� (���������) � ������� InsideAccountPositions  (���� ID) �� ������� !!!
	'Name' TEXT NOT NULL -- ��������� ��� ��������� ������� �����
)
;

-- ��������� ������
CREATE TABLE 'dicBalanceAccounts'
(
	'ID' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, -- !!! ���� �� ����������������� ����� ���������� ���� (���������) � ������� BalanceAccount  (���� ID) �� ������� !!!
	'Name' TEXT NOT NULL -- ��������� ��� �����
)
;

-- �������� ��������� ������ �� ��������� ������
CREATE TABLE 'BalanceInfo'
(
	'ID' INTEGER NOT NULL PRIMARY KEY,
	'BalanceAccountId' INTEGER NOT NULL, -- ����������������� ����� �����
	'InsideAccountPositionId' INTEGER NOT NULL, -- ����������������� ����� ��������� ������� �����
	'InsideAccountPositionValue' TEXT NOT NULL, -- �������� ��������� ������� �����
	'RequestId' INTEGER NOT NULL, -- ������ ��������� � ��������� ���������� ���������� �� �����

	CONSTRAINT 'FK_BalanceInfo_Requests' FOREIGN KEY ('RequestId') REFERENCES 'Requests' ('ID') ON DELETE No Action ON UPDATE No Action
)
;

-- �������� ������ ��� ����� � �����������
CREATE TABLE 'ApplicationAccount'
(
	'ID' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'Login' TEXT NOT NULL, -- ��� ������������
	'Password' TEXT NOT NULL, -- ������ ��� ����� � ����������
	'EditDate' TEXT NOT NULL -- ���� ����������� ���������
)
;

CREATE INDEX 'IXFK_BalanceInfo_Requests'
 ON 'BalanceInfo' ('RequestId' ASC)
;
