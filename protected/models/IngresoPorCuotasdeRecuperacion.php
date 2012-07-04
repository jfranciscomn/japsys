<?php

/**
 * This is the model class for table "IngresoPorCuotasdeRecuperacion".
 *
 * The followings are the available columns in table 'IngresoPorCuotasdeRecuperacion':
 * @property integer $id
 * @property double $consultas
 * @property double $despensas
 * @property double $otro
 * @property integer $institucion_aid
 * @property integer $ejercicioFiscal_did
 * @property integer $estatus_did
 * @property integer $editable
 * @property string $ultimaModificacion_dt
 *
 * The followings are the available model relations:
 * @property Institucion $institucion
 * @property Estatus $estatus
 * @property EjercicioFiscal $ejercicioFiscal
 */
class IngresoPorCuotasdeRecuperacion extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return IngresoPorCuotasdeRecuperacion the static model class
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
		return 'IngresoPorCuotasdeRecuperacion';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('consultas, despensas, otro, institucion_aid, ejercicioFiscal_did, estatus_did, editable, ultimaModificacion_dt', 'required'),
			array('institucion_aid, ejercicioFiscal_did, estatus_did, editable', 'numerical', 'integerOnly'=>true),
			array('consultas, despensas, otro', 'numerical'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, consultas, despensas, otro, institucion_aid, ejercicioFiscal_did, estatus_did, editable, ultimaModificacion_dt', 'safe', 'on'=>'search'),
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
			'institucion' => array(self::BELONGS_TO, 'Institucion', 'institucion_aid'),
			'estatus' => array(self::BELONGS_TO, 'Estatus', 'estatus_did'),
			'ejercicioFiscal' => array(self::BELONGS_TO, 'EjercicioFiscal', 'ejercicioFiscal_did'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'consultas' => 'Consultas',
			'despensas' => 'Despensas',
			'otro' => 'Otro',
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
		$criteria->compare('consultas',$this->consultas);
		$criteria->compare('despensas',$this->despensas);
		$criteria->compare('otro',$this->otro);
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