<?php

/**
 * This is the model class for table "AreaGeografica".
 *
 * The followings are the available columns in table 'AreaGeografica':
 * @property integer $id
 * @property string $nombre
 * @property integer $estatus
 *
 * The followings are the available model relations:
 * @property Institucion $institucion
 */
class AreaGeografica extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return AreaGeografica the static model class
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
		return 'AreaGeografica';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre, estatus', 'required'),
			array('estatus', 'numerical', 'integerOnly'=>true),
			array('nombre', 'length', 'max'=>145),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre, estatus', 'safe', 'on'=>'search'),
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
			'institucion' => array(self::HAS_ONE, 'Institucion', 'areageografica_id'),
			'estatus0' => array(self::BELONGS_TO, 'Estatus', 'estatus'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombre' => 'Nombre',
			'estatus' => 'Estatus',
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
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('estatus',$this->estatus);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}