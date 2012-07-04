<?php

/**
 * This is the model class for table "Institucion".
 *
 * The followings are the available columns in table 'Institucion':
 * @property integer $id
 * @property string $nombre
 * @property string $siglas
 * @property string $mision
 * @property string $vision
 * @property string $domicioDireccion
 * @property string $domicilioCP
 * @property integer $municipio_aid
 * @property string $contactoTelefono
 * @property string $contactoFax
 * @property string $contactoEmail
 * @property string $fechaConstitucion_dt
 * @property string $fechaTransformacion_dt
 * @property string $rfc
 * @property integer $donativoDeducible
 * @property integer $donativoConvenio
 * @property string $cluni
 * @property integer $ambito_did
 * @property integer $areaGeografica_did
 * @property integer $horasPromedio_trabajador
 * @property integer $estatus_did
 *
 * The followings are the available model relations:
 * @property GastoDeAdministracion[] $gastoDeAdministracions
 * @property GastoOperativo[] $gastoOperativos
 * @property IngresoPorCuotasdeRecuperacion[] $ingresoPorCuotasdeRecuperacions
 * @property IngresoPorDonativo[] $ingresoPorDonativos
 * @property IngresoPorEvento[] $ingresoPorEventos
 * @property IngresoPorVenta[] $ingresoPorVentas
 * @property AreaGeografica $areaGeografica
 * @property Ambito $ambito
 * @property Estatus $estatus
 * @property Municipio $municipio
 * @property Usuario[] $usuarios
 */
class Institucion extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Institucion the static model class
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
		return 'Institucion';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre, siglas, domicioDireccion, domicilioCP, municipio_aid, fechaConstitucion_dt, rfc, donativoDeducible, donativoConvenio, ambito_did, areaGeografica_did, estatus_did', 'required'),
			array('municipio_aid, donativoDeducible, donativoConvenio, ambito_did, areaGeografica_did, horasPromedio_trabajador, estatus_did', 'numerical', 'integerOnly'=>true),
			array('nombre, domicioDireccion, contactoEmail', 'length', 'max'=>145),
			array('siglas, domicilioCP, contactoTelefono, contactoFax, cluni', 'length', 'max'=>45),
			array('rfc', 'length', 'max'=>13),
			array('mision, vision, fechaTransformacion_dt', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre, siglas, mision, vision, domicioDireccion, domicilioCP, municipio_aid, contactoTelefono, contactoFax, contactoEmail, fechaConstitucion_dt, fechaTransformacion_dt, rfc, donativoDeducible, donativoConvenio, cluni, ambito_did, areaGeografica_did, horasPromedio_trabajador, estatus_did', 'safe', 'on'=>'search'),
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
			'gastoDeAdministracions' => array(self::HAS_MANY, 'GastoDeAdministracion', 'institucion_aid'),
			'gastoOperativos' => array(self::HAS_MANY, 'GastoOperativo', 'institucion_aid'),
			'ingresoPorCuotasdeRecuperacions' => array(self::HAS_MANY, 'IngresoPorCuotasdeRecuperacion', 'institucion_aid'),
			'ingresoPorDonativos' => array(self::HAS_MANY, 'IngresoPorDonativo', 'institucion_aid'),
			'ingresoPorEventos' => array(self::HAS_MANY, 'IngresoPorEvento', 'institucion_aid'),
			'ingresoPorVentas' => array(self::HAS_MANY, 'IngresoPorVenta', 'institucion_aid'),
			'areaGeografica' => array(self::BELONGS_TO, 'AreaGeografica', 'areaGeografica_did'),
			'ambito' => array(self::BELONGS_TO, 'Ambito', 'ambito_did'),
			'estatus' => array(self::BELONGS_TO, 'Estatus', 'estatus_did'),
			'municipio' => array(self::BELONGS_TO, 'Municipio', 'municipio_aid'),
			'usuarios' => array(self::HAS_MANY, 'Usuario', 'institucion_aid'),
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
			'siglas' => 'Siglas',
			'mision' => 'Mision',
			'vision' => 'Vision',
			'domicioDireccion' => 'Domicio Direccion',
			'domicilioCP' => 'Domicilio Cp',
			'municipio_aid' => 'Municipio',
			'contactoTelefono' => 'Contacto Telefono',
			'contactoFax' => 'Contacto Fax',
			'contactoEmail' => 'Contacto Email',
			'fechaConstitucion_dt' => 'Fecha Constitucion',
			'fechaTransformacion_dt' => 'Fecha Transformacion',
			'rfc' => 'Rfc',
			'donativoDeducible' => 'Donativo Deducible',
			'donativoConvenio' => 'Donativo Convenio',
			'cluni' => 'Cluni',
			'ambito_did' => 'Ambito',
			'areaGeografica_did' => 'Area Geografica',
			'horasPromedio_trabajador' => 'Horas Promedio Trabajador',
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
		$criteria->compare('siglas',$this->siglas,true);
		$criteria->compare('mision',$this->mision,true);
		$criteria->compare('vision',$this->vision,true);
		$criteria->compare('domicioDireccion',$this->domicioDireccion,true);
		$criteria->compare('domicilioCP',$this->domicilioCP,true);
		$criteria->compare('municipio_aid',$this->municipio_aid);
		$criteria->compare('contactoTelefono',$this->contactoTelefono,true);
		$criteria->compare('contactoFax',$this->contactoFax,true);
		$criteria->compare('contactoEmail',$this->contactoEmail,true);
		$criteria->compare('fechaConstitucion_dt',$this->fechaConstitucion_dt,true);
		$criteria->compare('fechaTransformacion_dt',$this->fechaTransformacion_dt,true);
		$criteria->compare('rfc',$this->rfc,true);
		$criteria->compare('donativoDeducible',$this->donativoDeducible);
		$criteria->compare('donativoConvenio',$this->donativoConvenio);
		$criteria->compare('cluni',$this->cluni,true);
		$criteria->compare('ambito_did',$this->ambito_did);
		$criteria->compare('areaGeografica_did',$this->areaGeografica_did);
		$criteria->compare('horasPromedio_trabajador',$this->horasPromedio_trabajador);
		$criteria->compare('estatus_did',$this->estatus_did);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}