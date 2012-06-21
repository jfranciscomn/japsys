<?php

/**
 * This is the model class for table "GastoOperativo".
 *
 * The followings are the available columns in table 'GastoOperativo':
 * @property integer $id
 * @property double $sueldos
 * @property double $honorarios
 * @property double $combustibles
 * @property double $luzTelefono
 * @property double $papeleria
 * @property double $renta
 * @property double $impuestosDerechos
 * @property double $otros
 * @property integer $institucion_id
 * @property integer $ejercicio_id
 * @property integer $estatus_id
 * @property integer $editable
 * @property string $ultimaModificacion
 *
 * The followings are the available model relations:
 * @property Estatus $estatus
 * @property EjercicioFiscal $ejercicio
 * @property Institucion $institucion
 */
class GastoOperativo extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return GastoOperativo the static model class
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
		return 'GastoOperativo';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('sueldos, honorarios, combustibles, luzTelefono, papeleria, renta, impuestosDerechos, otros, institucion_id, ejercicio_id, estatus_id, editable, ultimaModificacion', 'required'),
			array('institucion_id, ejercicio_id, estatus_id, editable', 'numerical', 'integerOnly'=>true),
			array('sueldos, honorarios, combustibles, luzTelefono, papeleria, renta, impuestosDerechos, otros', 'numerical'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, sueldos, honorarios, combustibles, luzTelefono, papeleria, renta, impuestosDerechos, otros, institucion_id, ejercicio_id, estatus_id, editable, ultimaModificacion', 'safe', 'on'=>'search'),
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
			'ejercicio' => array(self::BELONGS_TO, 'EjercicioFiscal', 'ejercicio_id'),
			'institucion' => array(self::BELONGS_TO, 'Institucion', 'institucion_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'sueldos' => 'Sueldos',
			'honorarios' => 'Honorarios',
			'combustibles' => 'Combustibles',
			'luzTelefono' => 'Luz Telefono',
			'papeleria' => 'Papeleria',
			'renta' => 'Renta',
			'impuestosDerechos' => 'Impuestos Derechos',
			'otros' => 'Otros',
			'institucion_id' => 'Institucion',
			'ejercicio_id' => 'Ejercicio',
			'estatus_id' => 'Estatus',
			'editable' => 'Editable',
			'ultimaModificacion' => 'Ultima Modificacion',
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
		$criteria->compare('sueldos',$this->sueldos);
		$criteria->compare('honorarios',$this->honorarios);
		$criteria->compare('combustibles',$this->combustibles);
		$criteria->compare('luzTelefono',$this->luzTelefono);
		$criteria->compare('papeleria',$this->papeleria);
		$criteria->compare('renta',$this->renta);
		$criteria->compare('impuestosDerechos',$this->impuestosDerechos);
		$criteria->compare('otros',$this->otros);
		$criteria->compare('institucion_id',$this->institucion_id);
		$criteria->compare('ejercicio_id',$this->ejercicio_id);
		$criteria->compare('estatus_id',$this->estatus_id);
		$criteria->compare('editable',$this->editable);
		$criteria->compare('ultimaModificacion',$this->ultimaModificacion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}