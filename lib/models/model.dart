import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'model.g.dart';

const tableUser = SqfEntityTable(
  tableName: 'user',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: true,
  modelName: null,
  fields: [
    SqfEntityField('firstName', DbType.text),
    SqfEntityField('lastName', DbType.text),
    SqfEntityField('email', DbType.text),
    SqfEntityField('password', DbType.text),
    SqfEntityField('profileUrl', DbType.text),
    SqfEntityField('isActive', DbType.bool, defaultValue: true),
    SqfEntityField('createdAt', DbType.integer),
    SqfEntityField('updatedAt', DbType.integer),
  ],
);

const tableFolder = SqfEntityTable(
  tableName: 'folder',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: true,
  modelName: null,
  fields: [
    SqfEntityField('title', DbType.text),
    SqfEntityField('imageUrl', DbType.text),
    SqfEntityField('createdAt', DbType.integer),
    SqfEntityField('updatedAt', DbType.integer),
  ],
);

const tableMyImage = SqfEntityTable(
    tableName: 'image',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    modelName: null,
    fields: [
      SqfEntityField('title', DbType.text),
      SqfEntityField('imageUrl', DbType.text),
      SqfEntityField('createdAt', DbType.integer),
      SqfEntityField('updatedAt', DbType.integer),
      SqfEntityField('isActive', DbType.bool, defaultValue: true),
      SqfEntityFieldRelationship(
          parentTable: tableFolder,
          deleteRule: DeleteRule.CASCADE,
          defaultValue: '0')
    ]);

@SqfEntityBuilder(basicModel)
const basicModel = SqfEntityModel(
  //bundledDatabasePath: 'assets/basic.sqlite',
  modelName: 'BasicModel',
  databaseName: 'basic.db',
  databaseTables: [tableMyImage, tableFolder, tableUser],
);
