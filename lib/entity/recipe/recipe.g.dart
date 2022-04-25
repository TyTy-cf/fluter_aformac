// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'recipe.dart';
//
// // **************************************************************************
// // IsarCollectionGenerator
// // **************************************************************************
//
// // ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable
//
// extension GetRecipeCollection on Isar {
//   IsarCollection<Recipe> get recipes => getCollection();
// }
//
// const RecipeSchema = CollectionSchema(
//   name: 'Recipe',
//   schema:
//       '{"name":"Recipe","idName":"id","properties":[{"name":"difficulty","type":"Long"},{"name":"duration","type":"Long"},{"name":"name","type":"String"},{"name":"nbPeople","type":"Long"},{"name":"price","type":"Long"}],"indexes":[],"links":[]}',
//   idName: 'id',
//   propertyIds: {
//     'difficulty': 0,
//     'duration': 1,
//     'name': 2,
//     'nbPeople': 3,
//     'price': 4
//   },
//   listProperties: {},
//   indexIds: {},
//   indexValueTypes: {},
//   linkIds: {},
//   backlinkLinkNames: {},
//   getId: _recipeGetId,
//   setId: _recipeSetId,
//   getLinks: _recipeGetLinks,
//   attachLinks: _recipeAttachLinks,
//   serializeNative: _recipeSerializeNative,
//   deserializeNative: _recipeDeserializeNative,
//   deserializePropNative: _recipeDeserializePropNative,
//   serializeWeb: _recipeSerializeWeb,
//   deserializeWeb: _recipeDeserializeWeb,
//   deserializePropWeb: _recipeDeserializePropWeb,
//   version: 3,
// );
//
// int? _recipeGetId(Recipe object) {
//   if (object.id == Isar.autoIncrement) {
//     return null;
//   } else {
//     return object.id;
//   }
// }
//
// void _recipeSetId(Recipe object, int id) {
//   object.id = id;
// }
//
// List<IsarLinkBase> _recipeGetLinks(Recipe object) {
//   return [];
// }
//
// void _recipeSerializeNative(
//     IsarCollection<Recipe> collection,
//     IsarRawObject rawObj,
//     Recipe object,
//     int staticSize,
//     List<int> offsets,
//     AdapterAlloc alloc) {
//   var dynamicSize = 0;
//   final value0 = object.difficulty;
//   final _difficulty = value0;
//   final value1 = object.duration;
//   final _duration = value1;
//   final value2 = object.name;
//   final _name = IsarBinaryWriter.utf8Encoder.convert(value2);
//   dynamicSize += (_name.length) as int;
//   final value3 = object.nbPeople;
//   final _nbPeople = value3;
//   final value4 = object.price;
//   final _price = value4;
//   final size = staticSize + dynamicSize;
//
//   rawObj.buffer = alloc(size);
//   rawObj.buffer_length = size;
//   final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
//   final writer = IsarBinaryWriter(buffer, staticSize);
//   writer.writeLong(offsets[0], _difficulty);
//   writer.writeLong(offsets[1], _duration);
//   writer.writeBytes(offsets[2], _name);
//   writer.writeLong(offsets[3], _nbPeople);
//   writer.writeLong(offsets[4], _price);
// }
//
// Recipe _recipeDeserializeNative(IsarCollection<Recipe> collection, int id,
//     IsarBinaryReader reader, List<int> offsets) {
//   final object = Recipe(
//     reader.readString(offsets[2]),
//     reader.readLong(offsets[3]),
//     reader.readLong(offsets[1]),
//     reader.readLong(offsets[0]),
//     reader.readLong(offsets[4]),
//   );
//   object.id = id;
//   return object;
// }
//
// P _recipeDeserializePropNative<P>(
//     int id, IsarBinaryReader reader, int propertyIndex, int offset) {
//   switch (propertyIndex) {
//     case -1:
//       return id as P;
//     case 0:
//       return (reader.readLong(offset)) as P;
//     case 1:
//       return (reader.readLong(offset)) as P;
//     case 2:
//       return (reader.readString(offset)) as P;
//     case 3:
//       return (reader.readLong(offset)) as P;
//     case 4:
//       return (reader.readLong(offset)) as P;
//     default:
//       throw 'Illegal propertyIndex';
//   }
// }
//
// dynamic _recipeSerializeWeb(IsarCollection<Recipe> collection, Recipe object) {
//   final jsObj = IsarNative.newJsObject();
//   IsarNative.jsObjectSet(jsObj, 'difficulty', object.difficulty);
//   IsarNative.jsObjectSet(jsObj, 'duration', object.duration);
//   IsarNative.jsObjectSet(jsObj, 'id', object.id);
//   IsarNative.jsObjectSet(jsObj, 'name', object.name);
//   IsarNative.jsObjectSet(jsObj, 'nbPeople', object.nbPeople);
//   IsarNative.jsObjectSet(jsObj, 'price', object.price);
//   return jsObj;
// }
//
// Recipe _recipeDeserializeWeb(IsarCollection<Recipe> collection, dynamic jsObj) {
//   final object = Recipe(
//     IsarNative.jsObjectGet(jsObj, 'name') ?? '',
//     IsarNative.jsObjectGet(jsObj, 'nbPeople') ?? double.negativeInfinity,
//     IsarNative.jsObjectGet(jsObj, 'duration') ?? double.negativeInfinity,
//     IsarNative.jsObjectGet(jsObj, 'difficulty') ?? double.negativeInfinity,
//     IsarNative.jsObjectGet(jsObj, 'price') ?? double.negativeInfinity,
//   );
//   object.id = IsarNative.jsObjectGet(jsObj, 'id');
//   return object;
// }
//
// P _recipeDeserializePropWeb<P>(Object jsObj, String propertyName) {
//   switch (propertyName) {
//     case 'difficulty':
//       return (IsarNative.jsObjectGet(jsObj, 'difficulty') ??
//           double.negativeInfinity) as P;
//     case 'duration':
//       return (IsarNative.jsObjectGet(jsObj, 'duration') ??
//           double.negativeInfinity) as P;
//     case 'id':
//       return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
//     case 'name':
//       return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
//     case 'nbPeople':
//       return (IsarNative.jsObjectGet(jsObj, 'nbPeople') ??
//           double.negativeInfinity) as P;
//     case 'price':
//       return (IsarNative.jsObjectGet(jsObj, 'price') ?? double.negativeInfinity)
//           as P;
//     default:
//       throw 'Illegal propertyName';
//   }
// }
//
// void _recipeAttachLinks(IsarCollection col, int id, Recipe object) {}
//
// extension RecipeQueryWhereSort on QueryBuilder<Recipe, Recipe, QWhere> {
//   QueryBuilder<Recipe, Recipe, QAfterWhere> anyId() {
//     return addWhereClauseInternal(const IdWhereClause.any());
//   }
// }
//
// extension RecipeQueryWhere on QueryBuilder<Recipe, Recipe, QWhereClause> {
//   QueryBuilder<Recipe, Recipe, QAfterWhereClause> idEqualTo(int id) {
//     return addWhereClauseInternal(IdWhereClause.between(
//       lower: id,
//       includeLower: true,
//       upper: id,
//       includeUpper: true,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterWhereClause> idNotEqualTo(int id) {
//     if (whereSortInternal == Sort.asc) {
//       return addWhereClauseInternal(
//         IdWhereClause.lessThan(upper: id, includeUpper: false),
//       ).addWhereClauseInternal(
//         IdWhereClause.greaterThan(lower: id, includeLower: false),
//       );
//     } else {
//       return addWhereClauseInternal(
//         IdWhereClause.greaterThan(lower: id, includeLower: false),
//       ).addWhereClauseInternal(
//         IdWhereClause.lessThan(upper: id, includeUpper: false),
//       );
//     }
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterWhereClause> idGreaterThan(int id,
//       {bool include = false}) {
//     return addWhereClauseInternal(
//       IdWhereClause.greaterThan(lower: id, includeLower: include),
//     );
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterWhereClause> idLessThan(int id,
//       {bool include = false}) {
//     return addWhereClauseInternal(
//       IdWhereClause.lessThan(upper: id, includeUpper: include),
//     );
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterWhereClause> idBetween(
//     int lowerId,
//     int upperId, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return addWhereClauseInternal(IdWhereClause.between(
//       lower: lowerId,
//       includeLower: includeLower,
//       upper: upperId,
//       includeUpper: includeUpper,
//     ));
//   }
// }
//
// extension RecipeQueryFilter on QueryBuilder<Recipe, Recipe, QFilterCondition> {
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> difficultyEqualTo(
//       int value) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.eq,
//       property: 'difficulty',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> difficultyGreaterThan(
//     int value, {
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.gt,
//       include: include,
//       property: 'difficulty',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> difficultyLessThan(
//     int value, {
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.lt,
//       include: include,
//       property: 'difficulty',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> difficultyBetween(
//     int lower,
//     int upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return addFilterConditionInternal(FilterCondition.between(
//       property: 'difficulty',
//       lower: lower,
//       includeLower: includeLower,
//       upper: upper,
//       includeUpper: includeUpper,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> durationEqualTo(
//       int value) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.eq,
//       property: 'duration',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> durationGreaterThan(
//     int value, {
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.gt,
//       include: include,
//       property: 'duration',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> durationLessThan(
//     int value, {
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.lt,
//       include: include,
//       property: 'duration',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> durationBetween(
//     int lower,
//     int upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return addFilterConditionInternal(FilterCondition.between(
//       property: 'duration',
//       lower: lower,
//       includeLower: includeLower,
//       upper: upper,
//       includeUpper: includeUpper,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idIsNull() {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.isNull,
//       property: 'id',
//       value: null,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idEqualTo(int? value) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.eq,
//       property: 'id',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idGreaterThan(
//     int? value, {
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.gt,
//       include: include,
//       property: 'id',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idLessThan(
//     int? value, {
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.lt,
//       include: include,
//       property: 'id',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> idBetween(
//     int? lower,
//     int? upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return addFilterConditionInternal(FilterCondition.between(
//       property: 'id',
//       lower: lower,
//       includeLower: includeLower,
//       upper: upper,
//       includeUpper: includeUpper,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameEqualTo(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.eq,
//       property: 'name',
//       value: value,
//       caseSensitive: caseSensitive,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameGreaterThan(
//     String value, {
//     bool caseSensitive = true,
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.gt,
//       include: include,
//       property: 'name',
//       value: value,
//       caseSensitive: caseSensitive,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameLessThan(
//     String value, {
//     bool caseSensitive = true,
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.lt,
//       include: include,
//       property: 'name',
//       value: value,
//       caseSensitive: caseSensitive,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameBetween(
//     String lower,
//     String upper, {
//     bool caseSensitive = true,
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return addFilterConditionInternal(FilterCondition.between(
//       property: 'name',
//       lower: lower,
//       includeLower: includeLower,
//       upper: upper,
//       includeUpper: includeUpper,
//       caseSensitive: caseSensitive,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.startsWith,
//       property: 'name',
//       value: value,
//       caseSensitive: caseSensitive,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.endsWith,
//       property: 'name',
//       value: value,
//       caseSensitive: caseSensitive,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameContains(String value,
//       {bool caseSensitive = true}) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.contains,
//       property: 'name',
//       value: value,
//       caseSensitive: caseSensitive,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nameMatches(
//       String pattern,
//       {bool caseSensitive = true}) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.matches,
//       property: 'name',
//       value: pattern,
//       caseSensitive: caseSensitive,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nbPeopleEqualTo(
//       int value) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.eq,
//       property: 'nbPeople',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nbPeopleGreaterThan(
//     int value, {
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.gt,
//       include: include,
//       property: 'nbPeople',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nbPeopleLessThan(
//     int value, {
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.lt,
//       include: include,
//       property: 'nbPeople',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> nbPeopleBetween(
//     int lower,
//     int upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return addFilterConditionInternal(FilterCondition.between(
//       property: 'nbPeople',
//       lower: lower,
//       includeLower: includeLower,
//       upper: upper,
//       includeUpper: includeUpper,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> priceEqualTo(int value) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.eq,
//       property: 'price',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> priceGreaterThan(
//     int value, {
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.gt,
//       include: include,
//       property: 'price',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> priceLessThan(
//     int value, {
//     bool include = false,
//   }) {
//     return addFilterConditionInternal(FilterCondition(
//       type: ConditionType.lt,
//       include: include,
//       property: 'price',
//       value: value,
//     ));
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterFilterCondition> priceBetween(
//     int lower,
//     int upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return addFilterConditionInternal(FilterCondition.between(
//       property: 'price',
//       lower: lower,
//       includeLower: includeLower,
//       upper: upper,
//       includeUpper: includeUpper,
//     ));
//   }
// }
//
// extension RecipeQueryLinks on QueryBuilder<Recipe, Recipe, QFilterCondition> {}
//
// extension RecipeQueryWhereSortBy on QueryBuilder<Recipe, Recipe, QSortBy> {
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByDifficulty() {
//     return addSortByInternal('difficulty', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByDifficultyDesc() {
//     return addSortByInternal('difficulty', Sort.desc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByDuration() {
//     return addSortByInternal('duration', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByDurationDesc() {
//     return addSortByInternal('duration', Sort.desc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortById() {
//     return addSortByInternal('id', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByIdDesc() {
//     return addSortByInternal('id', Sort.desc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByName() {
//     return addSortByInternal('name', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByNameDesc() {
//     return addSortByInternal('name', Sort.desc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByNbPeople() {
//     return addSortByInternal('nbPeople', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByNbPeopleDesc() {
//     return addSortByInternal('nbPeople', Sort.desc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByPrice() {
//     return addSortByInternal('price', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> sortByPriceDesc() {
//     return addSortByInternal('price', Sort.desc);
//   }
// }
//
// extension RecipeQueryWhereSortThenBy
//     on QueryBuilder<Recipe, Recipe, QSortThenBy> {
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByDifficulty() {
//     return addSortByInternal('difficulty', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByDifficultyDesc() {
//     return addSortByInternal('difficulty', Sort.desc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByDuration() {
//     return addSortByInternal('duration', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByDurationDesc() {
//     return addSortByInternal('duration', Sort.desc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenById() {
//     return addSortByInternal('id', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByIdDesc() {
//     return addSortByInternal('id', Sort.desc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByName() {
//     return addSortByInternal('name', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByNameDesc() {
//     return addSortByInternal('name', Sort.desc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByNbPeople() {
//     return addSortByInternal('nbPeople', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByNbPeopleDesc() {
//     return addSortByInternal('nbPeople', Sort.desc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByPrice() {
//     return addSortByInternal('price', Sort.asc);
//   }
//
//   QueryBuilder<Recipe, Recipe, QAfterSortBy> thenByPriceDesc() {
//     return addSortByInternal('price', Sort.desc);
//   }
// }
//
// extension RecipeQueryWhereDistinct on QueryBuilder<Recipe, Recipe, QDistinct> {
//   QueryBuilder<Recipe, Recipe, QDistinct> distinctByDifficulty() {
//     return addDistinctByInternal('difficulty');
//   }
//
//   QueryBuilder<Recipe, Recipe, QDistinct> distinctByDuration() {
//     return addDistinctByInternal('duration');
//   }
//
//   QueryBuilder<Recipe, Recipe, QDistinct> distinctById() {
//     return addDistinctByInternal('id');
//   }
//
//   QueryBuilder<Recipe, Recipe, QDistinct> distinctByName(
//       {bool caseSensitive = true}) {
//     return addDistinctByInternal('name', caseSensitive: caseSensitive);
//   }
//
//   QueryBuilder<Recipe, Recipe, QDistinct> distinctByNbPeople() {
//     return addDistinctByInternal('nbPeople');
//   }
//
//   QueryBuilder<Recipe, Recipe, QDistinct> distinctByPrice() {
//     return addDistinctByInternal('price');
//   }
// }
//
// extension RecipeQueryProperty on QueryBuilder<Recipe, Recipe, QQueryProperty> {
//   QueryBuilder<Recipe, int, QQueryOperations> difficultyProperty() {
//     return addPropertyNameInternal('difficulty');
//   }
//
//   QueryBuilder<Recipe, int, QQueryOperations> durationProperty() {
//     return addPropertyNameInternal('duration');
//   }
//
//   QueryBuilder<Recipe, int?, QQueryOperations> idProperty() {
//     return addPropertyNameInternal('id');
//   }
//
//   QueryBuilder<Recipe, String, QQueryOperations> nameProperty() {
//     return addPropertyNameInternal('name');
//   }
//
//   QueryBuilder<Recipe, int, QQueryOperations> nbPeopleProperty() {
//     return addPropertyNameInternal('nbPeople');
//   }
//
//   QueryBuilder<Recipe, int, QQueryOperations> priceProperty() {
//     return addPropertyNameInternal('price');
//   }
// }
