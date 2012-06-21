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
 * @property string $domicio_direccion
 * @property string $domicilio_cp
 * @property integer $domicilio_municipio_id
 * @property string $contacto_telefono
 * @property string $contacto_fax
 * @property string $contacto_email
 * @property string $fecha_constitucion
 * @property string $fecha_transformacion
 * @property string $rfc
 * @property integer $donativo_deducible
 * @property integer $donativo_convenio
 * @property string $cluni
 * @property integer $ambito_id
 * @property integer $areageografica_id
 * @property integer $horas_promedio_trabajador
 * @property integer $estatus
 *
 * The followings are the available model relations:
 * @property Ambito $ambito
 * @property AreaGeografica $areageografica
 * @property Estatus $estatus0
 * @property Municipio $domicilioMunicipio
 */
class Institucion extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
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
			array('nombre, siglas, domicio_direccion, domicilio_cp, domicilio_municipio_id, fecha_constitucion, rfc, donativo_deducible, donativo_convenio, ambito_id, areageografica_id, estatus', 'required'),
			array('domicilio_municipio_id, donativo_deducible, donativo_convenio, ambito_id, areageografica_id, horas_promedio_trabajador, estatus', 'numerical', 'integerOnly'=>true),
			array('nombre, domicio_direccion, contacto_email', 'length', 'max'=>145),
			array('siglas, domicilio_cp, contacto_telefono, contacto_fax, cluni', 'length', 'max'=>45),
			array('rfc', 'length', 'max'=>13),
			array('mision, vision, fecha_transformacion', 'safe'),
			array('nombre','unique'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre, siglas, mision, vision, domicio_direccion, domicilio_cp, domicilio_municipio_id, contacto_telefono, contacto_fax, contacto_email, fecha_constitucion, fecha_transformacion, rfc, donativo_deducible, donativo_convenio, cluni, ambito_id, areageografica_id, horas_promedio_trabajador, estatus', 'safe', 'on'=>'search'),
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
			'ambito' => array(self::BELONGS_TO, 'Ambito', 'ambito_id'),
			'areageografica' => array(self::BELONGS_TO, 'AreaGeografica', 'areageografica_id'),
			'estatus0' => array(self::BELONGS_TO, 'Estatus', 'estatus'),
			'domicilioMunicipio' => array(self::BELONGS_TO, 'Municipio', 'domicilio_municipio_id'),
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
			'domicio_direccion' => 'Direccion',
			'domicilio_cp' => 'Codigo Postal',
			'domicilio_municipio_id' => 'Municipio',
			'contacto_telefono' => 'Telefono',
			'contacto_fax' => 'Fax',
			'contacto_email' => 'Email',
			'fecha_constitucion' => 'Fecha de Constitucion',
			'fecha_transformacion' => 'Fecha de Transformacion',
			'rfc' => 'Rfc',
			'donativo_deducible' => 'Donativo Deducibles de Impuestos',
			'donativo_convenio' => 'Donativo Convenio de Convenios Internacionales',
			'cluni' => 'Clave Cluni',
			'ambito_id' => 'Ambito',
			'areageografica_id' => 'Areageografica',
			'horas_promedio_trabajador' => 'Horas Promedio Trabajador',
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
		$criteria->compare('siglas',$this->siglas,true);
		$criteria->compare('mision',$this->mision,true);
		$criteria->compare('vision',$this->vision,true);
		$criteria->compare('domicio_direccion',$this->domicio_direccion,true);
		$criteria->compare('domicilio_cp',$this->domicilio_cp,true);
		$criteria->compare('domicilio_municipio_id',$this->domicilio_municipio_id);
		$criteria->compare('contacto_telefono',$this->contacto_telefono,true);
		$criteria->compare('contacto_fax',$this->contacto_fax,true);
		$criteria->compare('contacto_email',$this->contacto_email,true);
		$criteria->compare('fecha_constitucion',$this->fecha_constitucion,true);
		$criteria->compare('fecha_transformacion',$this->fecha_transformacion,true);
		$criteria->compare('rfc',$this->rfc,true);
		$criteria->compare('donativo_deducible',$this->donativo_deducible);
		$criteria->compare('donativo_convenio',$this->donativo_convenio);
		$criteria->compare('cluni',$this->cluni,true);
		$criteria->compare('ambito_id',$this->ambito_id);
		$criteria->compare('areageografica_id',$this->areageografica_id);
		$criteria->compare('horas_promedio_trabajador',$this->horas_promedio_trabajador);
		$criteria->compare('estatus',$this->estatus);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}