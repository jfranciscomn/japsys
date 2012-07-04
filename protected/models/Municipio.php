<?php

/**
 * This is the model class for table "Municipio".
 *
 * The followings are the available columns in table 'Municipio':
 * @property integer $id
 * @property string $clave
 * @property string $nombre
 * @property integer $estado_did
 * @property integer $estatus_did
 *
 * The followings are the available model relations:
 * @property Institucion[] $institucions
 * @property Estado $estado
 * @property Estatus $estatus
 */
class Municipio extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Municipio the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'Municipio';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('clave, nombre, estado_did, estatus_did', 'required'),
			array('estado_did, estatus_did', 'numerical', 'integerOnly'=>true),
			array('clave', 'length', 'max'=>45),
			array('nombre', 'length', 'max'=>145),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, clave, nombre, estado_did, estatus_did', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'institucions' => array(self::HAS_MANY, 'Institucion', 'municipio_aid'),
			'estado' => array(self::BELONGS_TO, 'Estado', 'estado_did'),
			'estatus' => array(self::BELONGS_TO, 'Estatus', 'estatus_did'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'clave' => 'Clave',
			'nombre' => 'Nombre',
			'estado_did' => 'Estado',
			'estatus_did' => 'Estatus',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('clave',$this->clave,true);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('estado_did',$this->estado_did);
		$criteria->compare('estatus_did',$this->estatus_did);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}