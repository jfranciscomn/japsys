<?php

/**
 * This is the model class for table "EjercicioFiscal".
 *
 * The followings are the available columns in table 'EjercicioFiscal':
 * @property integer $id
 * @property string $nombre
 * @property string $fechaInicio_dt
 * @property string $fechaFin_dt
 * @property integer $estatus_did
 *
 * The followings are the available model relations:
 * @property Estatus $estatus
 * @property GastoDeAdministracion[] $gastoDeAdministracions
 * @property GastoOperativo[] $gastoOperativos
 * @property IngresoPorCuotasdeRecuperacion[] $ingresoPorCuotasdeRecuperacions
 * @property IngresoPorDonativo[] $ingresoPorDonativos
 * @property IngresoPorEvento[] $ingresoPorEventos
 * @property IngresoPorVenta[] $ingresoPorVentas
 */
class EjercicioFiscal extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
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
			array('nombre, fechaInicio_dt, estatus_did', 'required'),
			array('estatus_did', 'numerical', 'integerOnly'=>true),
			array('nombre', 'length', 'max'=>145),
			array('fechaFin_dt', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre, fechaInicio_dt, fechaFin_dt, estatus_did', 'safe', 'on'=>'search'),
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
			'estatus' => array(self::BELONGS_TO, 'Estatus', 'estatus_did'),
			'gastoDeAdministracions' => array(self::HAS_MANY, 'GastoDeAdministracion', 'ejercicioFisca_did'),
			'gastoOperativos' => array(self::HAS_MANY, 'GastoOperativo', 'ejercicioFiscal_did'),
			'ingresoPorCuotasdeRecuperacions' => array(self::HAS_MANY, 'IngresoPorCuotasdeRecuperacion', 'ejercicioFiscal_did'),
			'ingresoPorDonativos' => array(self::HAS_MANY, 'IngresoPorDonativo', 'ejercicioFiscal_did'),
			'ingresoPorEventos' => array(self::HAS_MANY, 'IngresoPorEvento', 'ejercicioFiscal_did'),
			'ingresoPorVentas' => array(self::HAS_MANY, 'IngresoPorVenta', 'ejercicio_did'),
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
			'fechaInicio_dt' => 'Fecha Inicio',
			'fechaFin_dt' => 'Fecha Fin',
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
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('fechaInicio_dt',$this->fechaInicio_dt,true);
		$criteria->compare('fechaFin_dt',$this->fechaFin_dt,true);
		$criteria->compare('estatus_did',$this->estatus_did);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}