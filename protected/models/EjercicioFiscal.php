<?php

/**
 * This is the model class for table "EjercicioFiscal".
 *
 * The followings are the available columns in table 'EjercicioFiscal':
 * @property integer $id
 * @property string $nombre
 * @property string $fecha_inicio
 * @property string $fecha_fin
 * @property integer $estatus_id
 *
 * The followings are the available model relations:
 * @property Estatus $estatus
 */
class EjercicioFiscal extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return EjercicioFiscal the static model class
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
		return 'EjercicioFiscal';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre, fecha_inicio, estatus_id', 'required'),
			array('estatus_id', 'numerical', 'integerOnly'=>true),
			array('nombre', 'length', 'max'=>145),
			array('fecha_fin', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre, fecha_inicio, fecha_fin, estatus_id', 'safe', 'on'=>'search'),
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
			'estatus' => array(self::BELONGS_TO, 'Estatus', 'estatus_id'),
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
			'fecha_inicio' => 'Fecha Inicio',
			'fecha_fin' => 'Fecha Fin',
			'estatus_id' => 'Estatus',
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
		$criteria->compare('fecha_inicio',$this->fecha_inicio,true);
		$criteria->compare('fecha_fin',$this->fecha_fin,true);
		$criteria->compare('estatus_id',$this->estatus_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}