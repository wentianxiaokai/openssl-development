#include <stdio.h> 
#include <string.h> 
#include <stdlib.h> 
#include <openssl/bn.h> 
#include <openssl/rsa.h> 
#include <openssl/pem.h>
/************************************************************************  
RSA密钥生成函数
file: test_rsa_genkey.c
gcc -Wall -O2 -o test_rsa_genkey test_rsa_genkey.c -lcrypto
author: tonglulin@gmail.com by www.qmailer.net  
************************************************************************/ 
int main(int argc, char *argv[]) 
{     
	int i=1;
	int flag = 0;
	while(i--)
	{
		/* 产生RSA密钥 */     
		RSA *rsa = RSA_generate_key(1024, 65537, NULL, NULL);
		char* bignum_char = BN_bn2hex(rsa->n);
		printf("BIGNUM: %d\n%s\n",strlen(bignum_char), bignum_char);
		free(bignum_char);



    	// BIO    *bio = NULL;
     //    /* 从内存数据读 */
     //    bio = BIO_new(BIO_s_mem());
     //    BIO_puts(bio, my_event_base_arg->global_rsa_char);

     //    // rsa_public_key = PEM_read_bio_RSAPublicKey(bio, &rsa_public_key, NULL, NULL);
     //    rsa_public_key = PEM_read_bio_RSA_PUBKEY(bio, &rsa_public_key, NULL, NULL);
     //    if (rsa_public_key == NULL) {
     //        return -107;
     //    }
    	// BIO_free(bio);



     //    BIO *key = NULL;
     //    RSA *r = NULL;
     //    key = BIO_new(BIO_s_file());
     //    BIO_read_filename(key, "c:\\private.key");
     //    r = PEM_read_bio_RSAPrivateKey(key, NULL, NULL, NULL);
     //    BIO_free_all(key);




  //   	BIO    *bio = NULL;
  //       /* 从内存数据读 */
  //       bio = BIO_new(BIO_s_mem());
		// flag = PEM_write_bio_RSAPrivateKey(bio, rsa, NULL, NULL, 0, NULL, NULL);
		// printf("PEM_write_bio_RSAPrivateKey flag:%d\n", flag);
		// char buf[20480];
		// long size=20480;
		// size = BIO_gets(bio, buf,size);
		// buf[size]='\0';
		// printf("BIO_gets size:%d\n bio pri:%s\n", buf);
  //   	BIO_free(bio);
  //   	// BIO_free_all(bio);


  //   	bio = NULL;
  //       /* 从内存数据读 */
  //       bio = BIO_new(BIO_s_mem());
		// flag = PEM_write_bio_RSA_PUBKEY(bio, rsa);
		// printf("PEM_write_bio_RSA_PUBKEY flag:%d\n", flag);
		// size=20480;
		// size = BIO_gets(bio,buf, size);
		// buf[size]='\0';
		// printf("BIO_gets size:%d\n bio pub:%s\n", buf);
  //   	BIO_free(bio);


    	printf("\n =============================== \n");
		/* 提取私钥 */     
		printf("PRIKEY:\n");
		PEM_write_RSAPrivateKey(stdout, rsa, NULL, NULL, 0, NULL, NULL);
		/* 提取公钥 */     
		unsigned char *n_b = (unsigned char *)calloc(RSA_size(rsa), sizeof(unsigned char));
		unsigned char *e_b = (unsigned char *)calloc(RSA_size(rsa), sizeof(unsigned char));
		int n_size = BN_bn2bin(rsa->n, n_b);
		int b_size = BN_bn2bin(rsa->e, e_b);
		RSA *pubrsa = RSA_new();
		pubrsa->n = BN_bin2bn(n_b, n_size, NULL);
		pubrsa->e = BN_bin2bn(e_b, b_size, NULL);
		printf("PUBKEY: \n");
		PEM_write_RSAPublicKey(stdout, pubrsa);
		printf("n_size:%d,b_size:%d,RSA_size(rsa):%d\n", n_size,b_size,RSA_size(rsa));
		// OPENSSL_free(rsa->n);
		RSA_free(rsa);
		RSA_free(pubrsa);
		// free(pubrsa);
		rsa = NULL;
		pubrsa = NULL;
		free(n_b);
		free(e_b);
		n_b = NULL;
		e_b = NULL;
		CRYPTO_cleanup_all_ex_data();
	}
	return 0;
}
