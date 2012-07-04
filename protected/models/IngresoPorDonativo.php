<?php

/**
 * This is the model class for table "IngresoPorDonativo".
 *
 * The followings are the available columns in table 'IngresoPorDonativo':
 * @property integer $id
 * @property double $personaFisica
 * @property double $personaMoral
 * @property double $fundacionesNacionales
 * @property double $fundacionesExtrajeras
 * @property double $fondosGubernamentales
 * @property double $especie
 * @property integer $institucion_aid
 * @property integer $ejercicioFiscal_did
 * @property integer $estatus_did
 * @property integer $editable
 * @property string $ultimaModificacion_dt
 *
 * The followings are the available model relations:
 * @property EjercicioFiscal $ejercicioFiscal
 * @property Estatus $estatus
 * @property Institucion $institucion
 */
class IngresoPorDonativo extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return IngresoPorDonativo the static model class
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
		return 'IngresoPorDonativo';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('institucion_aid, ejercicioFiscal_did, estatus_did, editable, ultimaModificacion_dt', 'required'),
			array('institucion_aid, ejercicioFiscal_did, estatus_did, editable', 'numerical', 'integerOnly'=>true),
			array('personaFisica, personaMoral, fundacionesNacionales, fundacionesExtrajeras, fondosGubernamentales, especie', 'numerical'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, personaFisica, personaMoral, fundacionesNacionales, fundacionesExtrajeras, fondosGubernamentales, especie, institucion_aid, ejercicioFiscal_did, estatus_did, editable, ultimaModificacion_dt', 'safe', 'on'=>'search'),
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
			'ejercicioFiscal' => array(self::BELONGS_TO, 'EjercicioFiscal', 'ejercicioFiscal_did'),
			'estatus' => array(self::BELONGS_TO, 'Estatus', 'estatus_did'),
			'institucion' => array(self::BELONGS_TO, 'Institucion', 'institucion_aid'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'personaFisica' => 'Persona Fisica',
			'personaMoral' => 'Persona Moral',
			'fundacionesNacionales' => 'Fundaciones Nacionales',
			'fundacionesExtrajeras' => 'Fundaciones Extrajeras',
			'fondosGubernamentales' => 'Fondos Gubernamentales',
			'especie' => 'Especie',
			'institucion_aid' => 'Institucion',
			'ejercicioFiscal_did' => 'Ejercicio Fiscal',
			'estatus_did' => 'Estatus',
			'editable' => 'Editable',
			'ultimaModificacion_dt' => 'Ultima Modificacion',
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
		$criteria->compare('personaFisica',$this->personaFisica);
		$criteria->compare('personaMoral',$this->personaMoral);
		$criteria->compare('fundacionesNacionales',$this->fundacionesNacionales);
		$criteria->compare('fundacionesExtrajeras',$this->fundacionesExtrajeras);
		$criteria->compare('fondosGubernamentales',$this->fondosGubernamentales);
		$criteria->compare('especie',$this->especie);
		$criteria->compare('institucion_aid',$this->institucion_aid);
		$criteria->compare('ejercicioFiscal_did',$this->ejercicioFiscal_did);
		$criteria->compare('estatus_did',$this->estatus_did);
		$criteria->compare('editable',$this->editable);
		$criteria->compare('ultimaModificacion_dt',$this->ultimaModificacion_dt,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}