<?php

/**
 * This is the model class for table "GastoDeAdministracion".
 *
 * The followings are the available columns in table 'GastoDeAdministracion':
 * @property integer $id
 * @property double $sueldos
 * @property double $honorarios
 * @property double $combustibles
 * @property double $luzTelefono
 * @property double $papeleria
 * @property double $impuestosDerechos
 * @property double $otros
 * @property integer $institucion_aid
 * @property integer $ejercicioFisca_did
 * @property integer $estatus_did
 * @property integer $editable
 * @property string $ultimaModificacion_dt
 *
 * The followings are the available model relations:
 * @property Estatus $estatus
 * @property EjercicioFiscal $ejercicioFisca
 * @property Institucion $institucion
 */
class GastoDeAdministracion extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return GastoDeAdministracion the static model class
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
		return 'GastoDeAdministracion';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('institucion_aid, ejercicioFisca_did, estatus_did, editable, ultimaModificacion_dt', 'required'),
			array('institucion_aid, ejercicioFisca_did, estatus_did, editable', 'numerical', 'integerOnly'=>true),
			array('sueldos, honorarios, combustibles, luzTelefono, papeleria, impuestosDerechos, otros', 'numerical'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, sueldos, honorarios, combustibles, luzTelefono, papeleria, impuestosDerechos, otros, institucion_aid, ejercicioFisca_did, estatus_did, editable, ultimaModificacion_dt', 'safe', 'on'=>'search'),
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
			'ejercicioFisca' => array(self::BELONGS_TO, 'EjercicioFiscal', 'ejercicioFisca_did'),
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
			'sueldos' => 'Sueldos',
			'honorarios' => 'Honorarios',
			'combustibles' => 'Combustibles',
			'luzTelefono' => 'Luz Telefono',
			'papeleria' => 'Papeleria',
			'impuestosDerechos' => 'Impuestos Derechos',
			'otros' => 'Otros',
			'institucion_aid' => 'Institucion',
			'ejercicioFisca_did' => 'Ejercicio Fisca',
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
		$criteria->compare('sueldos',$this->sueldos);
		$criteria->compare('honorarios',$this->honorarios);
		$criteria->compare('combustibles',$this->combustibles);
		$criteria->compare('luzTelefono',$this->luzTelefono);
		$criteria->compare('papeleria',$this->papeleria);
		$criteria->compare('impuestosDerechos',$this->impuestosDerechos);
		$criteria->compare('otros',$this->otros);
		$criteria->compare('institucion_aid',$this->institucion_aid);
		$criteria->compare('ejercicioFisca_did',$this->ejercicioFisca_did);
		$criteria->compare('estatus_did',$this->estatus_did);
		$criteria->compare('editable',$this->editable);
		$criteria->compare('ultimaModificacion_dt',$this->ultimaModificacion_dt,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}