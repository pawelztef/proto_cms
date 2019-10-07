$(() => { 
  CKEDITOR.editorConfig = function( config ) {
    config.toolbarGroups = [
      { name: 'styles', groups: [ 'styles' ] },
      { name: 'basicstyles', groups: [ 'basicstyles' ] },
      { name: 'clipboard', groups: [ 'undo' ] },
      '/',
      { name: 'paragraph', groups: [ 'align', 'list', 'links'] },
      { name: 'document', groups: [ 'blocks', 'blocks', 'mode'] },
      { name: 'tools', groups: [ 'tools' ] }
    ];

    config.removeButtons = 'Print,Preview,NewPage,Save,Templates,Cut,Copy,Paste,PasteText,PasteFromWord,Find,Replace,Scayt,SelectAll,Form,Checkbox,Radio,TextField,Textarea,Button,Select,ImageButton,HiddenField,Subscript,Superscript,RemoveFormat,CopyFormatting,BidiRtl,BidiLtr,Language,Unlink,Anchor,Image,Flash,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,Table,Styles,About,Outdent,Indent';
  };
})
