Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXlmtT1a"
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52198E7;
	Sun,  3 Dec 2023 05:36:34 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ce26a03d9eso281386b3a.0;
        Sun, 03 Dec 2023 05:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701610594; x=1702215394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6axBYazmeDA93V+UxnobZXpCr8uHFsXkX249x1Txu6c=;
        b=TXlmtT1ahaWzskgpllTQ9JSrOc1125gsd3nFVD7xXXko1AaKsQQ4X+oQWujNaNJuvT
         bj4fhLkZkHJ5sBBS4FTz3feOWLUgj7PdbdBG62spkmDcWvePdrbPt9fG3Cs8BaSWFd4J
         WdyJjKXSNHslrxyGJiolpEcpjWktz0mopOnC0cAQmb4PuFAwzj/7T//8SjCLc6tKAG6x
         WUkbVirpf+YCNHR42HKFgKx9qR2wKdLurIi100rHQH8Fpr4Sd7AbqOxwxdpI2mZRJtXl
         fn5r9ALKwf4D4GQsz8IqC7p3M9JxJrZXOGsk4qDgwA+6My2lKdEwshV87dGfSbZLu4Fh
         0zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701610594; x=1702215394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6axBYazmeDA93V+UxnobZXpCr8uHFsXkX249x1Txu6c=;
        b=uBK9vp/d3BHYO9iCL3x/SYNqLxoEc1IUn1nXT/N1MLnh9AugR8tR+cGcb7xGTf7RZW
         rjjSON6AoDVEkNugV5yp+b6MOp0OGSTE10tdwKtUlNE2MH4PezDKYGdGP26SlckZqCrz
         vx64ag1Uuqw+Sfg4BBTfvKAM576AlwJieFRnTHuRKVTBO0dpHQeYbPYhuFUpnxA740yu
         /XIkF+d1aRSf1ewAVE0lA/kyR53bZiP5yN0R81TyZEtpEGNrFlCpTmSCaDJHh9Yie1HL
         DlJgicZjzKqU7hypLze7sHdp2HgKCLDgdHU8c5kZPNHpmJkCCkFMCnnEMJJwc/YgA5Xb
         fKnQ==
X-Gm-Message-State: AOJu0YykpjNPBSyZOjopvCXqgKhg2dINyj57JzfAtZIzUaVb8v+5eLUc
	IoeHWcLrPbOCpp2IzVoqVTA=
X-Google-Smtp-Source: AGHT+IG9my+vXMrOhVTC6Y67vZhsJ/gWvgxupJPgUN0SDu191Ga5ESnNEpj+AHod1SIdB+nIaM997Q==
X-Received: by 2002:a05:6a00:1806:b0:6ce:2732:282 with SMTP id y6-20020a056a00180600b006ce27320282mr723178pfa.49.1701610593615;
        Sun, 03 Dec 2023 05:36:33 -0800 (PST)
Received: from attreyee-HP-Pavilion-Laptop-14-ec0xxx.. ([60.243.28.47])
        by smtp.gmail.com with ESMTPSA id c4-20020aa78804000000b006ce5066282bsm269588pfo.34.2023.12.03.05.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 05:36:33 -0800 (PST)
From: attreyee-muk <tintinm2017@gmail.com>
To: corbet@lwn.net
Cc: attreyee-muk <tintinm2017@gmail.com>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] Sounds better
Date: Sun,  3 Dec 2023 19:00:18 +0530
Message-Id: <20231203133017.18311-1-tintinm2017@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Respected Maintainers, 

I have made a small change in the submitting-patches.rst document. I was
reading the submitting-patches.rst file as I needed to understand
certain things for submitting patches. That is when I found this. 
It might not be a very sigificant change, but I think it just improves a
bit of a readability and I feel that "Don't get discouraged, or become impatient"
sounds better.

Hence, sending this patch. Requesting the maintains to have a look at
it. 

Thank You
Attreyee Mukehrjee 

Signed-off-by: Attreyee Mukherjee <tintinm2017@gmail.com>
---
 Documentation/process/submitting-patches.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 86d346bcb8ef..f524e63fb429 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -360,7 +360,7 @@ space. For more details see: http://daringfireball.net/2007/07/on_top ::
 
 .. _resend_reminders:
 
-Don't get discouraged - or impatient
+Don't get discouraged, or become impatient. 
 ------------------------------------
 
 After you have submitted your change, be patient and wait.  Reviewers are
-- 
2.34.1

