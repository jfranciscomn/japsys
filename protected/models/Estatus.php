<?php

/**
 * This is the model class for table "Estatus".
 *
 * The followings are the available columns in table 'Estatus':
 * @property integer $id
 * @property string $nombre
 *
 * The followings are the available model relations:
 * @property Ambito[] $ambitos
 * @property EjercicioFiscal[] $ejercicioFiscals
 * @property Estado[] $estados
 * @property GastoDeAdministracion[] $gastoDeAdministracions
 * @property GastoOperativo[] $gastoOperativos
 * @property IngresoPorCuotasdeRecuperacion[] $ingresoPorCuotasdeRecuperacions
 * @property IngresoPorDonativo[] $ingresoPorDonativos
 * @property IngresoPorEvento[] $ingresoPorEventos
 * @property IngresoPorVenta[] $ingresoPorVentas
 * @property IngresoPorVentaDetalle[] $ingresoPorVentaDetalles
 * @property Institucion[] $institucions
 * @property Municipio[] $municipios
 * @property TipoUsuario[] $tipoUsuarios
 * @property Usuario[] $usuarios
 */
class Estatus extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Estatus the static model class
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
		return 'Estatus';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre', 'required'),
			array('nombre', 'length', 'max'=>45),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre', 'safe', 'on'=>'search'),
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
			'ambitos' => array(self::HAS_MANY, 'Ambito', 'estatus_did'),
			'ejercicioFiscals' => array(self::HAS_MANY, 'EjercicioFiscal', 'estatus_did'),
			'estados' => array(self::HAS_MANY, 'Estado', 'estatus_did'),
			'gastoDeAdministracions' => array(self::HAS_MANY, 'GastoDeAdministracion', 'estatus_did'),
			'gastoOperativos' => array(self::HAS_MANY, 'GastoOperativo', 'estatus_did'),
			'ingresoPorCuotasdeRecuperacions' => array(self::HAS_MANY, 'IngresoPorCuotasdeRecuperacion', 'estatus_did'),
			'ingresoPorDonativos' => array(self::HAS_MANY, 'IngresoPorDonativo', 'estatus_did'),
			'ingresoPorEventos' => array(self::HAS_MANY, 'IngresoPorEvento', 'estatus_did'),
			'ingresoPorVentas' => array(self::HAS_MANY, 'IngresoPorVenta', 'estatus_did'),
			'ingresoPorVentaDetalles' => array(self::HAS_MANY, 'IngresoPorVentaDetalle', 'estatus_did'),
			'institucions' => array(self::HAS_MANY, 'Institucion', 'estatus_did'),
			'municipios' => array(self::HAS_MANY, 'Municipio', 'estatus_did'),
			'tipoUsuarios' => array(self::HAS_MANY, 'TipoUsuario', 'estatus_did'),
			'usuarios' => array(self::HAS_MANY, 'Usuario', 'estatus_did'),
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

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}