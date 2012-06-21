<?php

/**
 * This is the model class for table "IngresoPorVentaDetalle".
 *
 * The followings are the available columns in table 'IngresoPorVentaDetalle':
 * @property integer $id
 * @property string $concepto
 * @property double $cantidad
 * @property integer $ingresoPorVenta_id
 * @property integer $estatus_id
 *
 * The followings are the available model relations:
 * @property IngresoPorVenta $ingresoPorVenta
 * @property Estatus $estatus
 */
class IngresoPorVentaDetalle extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return IngresoPorVentaDetalle the static model class
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
		return 'IngresoPorVentaDetalle';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('cantidad, concepto, ingresoPorVenta_id, estatus_id', 'required'),
			array('ingresoPorVenta_id, estatus_id', 'numerical', 'integerOnly'=>true),
			array('cantidad', 'numerical'),
			array('concepto', 'length', 'max'=>150),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, concepto, cantidad, ingresoPorVenta_id, estatus_id', 'safe', 'on'=>'search'),
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
			'ingresoPorVenta' => array(self::BELONGS_TO, 'IngresoPorVenta', 'ingresoPorVenta_id'),
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
			'concepto' => 'Concepto',
			'cantidad' => 'Cantidad',
			'ingresoPorVenta_id' => 'Ingreso Por Venta',
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
		$criteria->compare('concepto',$this->concepto,true);
		$criteria->compare('cantidad',$this->cantidad);
		$criteria->compare('ingresoPorVenta_id',$this->ingresoPorVenta_id);
		$criteria->compare('estatus_id',$this->estatus_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}