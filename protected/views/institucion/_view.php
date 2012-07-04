	<tr>
		<td>
			<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->nombre); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->siglas); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->mision); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->vision); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->domicioDireccion); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->domicilioCP); ?>
		</td>
		<?php /*
		<td>
			<?php echo CHtml::encode($data->municipio->nombre); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->contactoTelefono); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->contactoFax); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->contactoEmail); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->fechaConstitucion_dt); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->fechaTransformacion_dt); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->rfc); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->donativoDeducible); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->donativoConvenio); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->cluni); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->ambito->nombre); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->areaGeografica->nombre); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->horasPromedio_trabajador); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->estatus->nombre); ?>
		</td>
		*/ ?>
	</tr>