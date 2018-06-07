class EnterController < ApplicationController
    def index

    end

    def enter
        if params[:password] == 'klfdkl_fdsdskf31_ddsf'
            cookies[:secret] = {value: 'addjsda23113*&d12312123__1212821*^^77&&SAas1', expires: 1.week.from_now}
            redirect_to '/login'
        else
            redirect_to '/enter'
        end
    end
end
