$( window ).load(init());

function init() {
    $('body').on('click', '.addButton', function () {
        $('#addModal').css('display', 'flex')
    })

    $('body').on('click', '.editButton', function () {
        const element_id = $(this).data('id');

        $('#editModal-'+element_id).css('display', 'flex');
    })

    $('body').on('click', '.closeButton', function () {
        const modal_type = $(this).data('type');

        console.log(modal_type)

        $('.'+modal_type+'Modal').hide();
    })
}