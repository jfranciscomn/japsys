<?php

/**
 * This is the model class for table "IngresoPorVentaDetalle".
 *
 * The followings are the available columns in table 'IngresoPorVentaDetalle':
 * @property integer $id
 * @property string $concepto
 * @property double $cantidad
 * @property integer $ingresoPorVenta_aid
 * @property integer $estatus_did
 *
 * The followings are the available model relations:
 * @property IngresoPorVenta $ingresoPorVenta
 * @property Estatus $estatus
 */
class IngresoPorVentaDetalle extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
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
			array('concepto, ingresoPorVenta_aid, estatus_did', 'required'),
			array('ingresoPorVenta_aid, estatus_did', 'numerical', 'integerOnly'=>true),
			array('cantidad', 'numerical'),
			array('concepto', 'length', 'max'=>150),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, concepto, cantidad, ingresoPorVenta_aid, estatus_did', 'safe', 'on'=>'search'),
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
			'ingresoPorVenta' => array(self::BELONGS_TO, 'IngresoPorVenta', 'ingresoPorVenta_aid'),
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
			'concepto' => 'Concepto',
			'cantidad' => 'Cantidad',
			'ingresoPorVenta_aid' => 'Ingreso Por Venta',
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
		$criteria->compare('concepto',$this->concepto,true);
		$criteria->compare('cantidad',$this->cantidad);
		$criteria->compare('ingresoPorVenta_aid',$this->ingresoPorVenta_aid);
		$criteria->compare('estatus_did',$this->estatus_did);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}