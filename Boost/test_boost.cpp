#include <boost/thread/thread.hpp>

#include <boost/numeric/ublas/vector.hpp>
#include <boost/numeric/ublas/matrix.hpp>
#include <boost/numeric/ublas/io.hpp>

#include <boost/spirit/include/qi_parse.hpp>
#include <boost/spirit/include/qi_core.hpp>

namespace bnu = boost::numeric::ublas;

/* y = A*x */
void multiplication_matrix() {
    bnu::vector<double> x(2);
    x(0) = 1;
    x(1) = 2;

    bnu::matrix<double> A(2, 2);
    A(0,0) = 0;
    A(0,1) = 1;
    A(1,0) = 2;
    A(1,1) = 3;

    bnu::vector<double> y = prod(A, x);

    //std::cout << y << std::endl;
}

void worker_func() {
    boost::posix_time::seconds workTime(4);

    std::cout << "Worker: running" << std::endl;
    boost::this_thread::sleep(workTime);

    std::cout << "Worker: finished" << std::endl;
}

int main() {
    boost::thread thread_multiplication_matrix(&multiplication_matrix);
    boost::thread worker_thread(worker_func);

    // std::cout << "main: waiting for thread" << std::endl;
    worker_thread.join();
    thread_multiplication_matrix.join();
    //std::cout << "main: done" << std::endl;

    return 0;
}