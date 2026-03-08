Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF23221FF23
	for <workflows@vger.kernel.org>; Sun,  8 Mar 2026 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772960790; cv=none; b=jW4tF1o8eupz+X1e/tdIHSMGcQmRN/C9Db7uc4PhS+uxDp6XMpmsr9AYwXSdSmzQbhXj2RkCQfUilBo7C+5Xw72h8eVyIOB4MyjrK1UQvqLUoKIw+6atvAR37BU53GeS6gbffO1uc4PurWsaCAphuO2p4U/npCoKsXh1MtVEFx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772960790; c=relaxed/simple;
	bh=JsNAl8WVMEKBfTmc/KX3qTDxx0gkZOBj8lf5LAO8h2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ob4Xq4EL/D4XbzIRE8yg+mq36b1KD/8GG9bEoYYhsb1hXJo8IfFHG2DiEd5CiLe1aoy4L9a/HF6GjzsFcM3lh4D7J268/bwzzKD/HbkGPHN+pa822/gmuv1p0gV7dcaRGdfdRSaSeVBEeC1hLN4RmvGjrcc3X0j7dvE5EKb/2No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmqveW1x; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmqveW1x"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ab077e3f32so46942785ad.3
        for <workflows@vger.kernel.org>; Sun, 08 Mar 2026 01:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772960789; x=1773565589; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hs7hPfZchDfkvHX8fv1Yt61YddgThCI8nWKUUUU6CWs=;
        b=ZmqveW1xXcjOo2KkZbsVja+2A6XPbCQfz1Jz+DOYLNErzyx1ttQVxRtgdC44Yz0ywT
         aPV1+5XT15SFq1p8xQpazfWZ6G6lAyYHdl49XLHQfekokrvXmRzQZs7QJRZiqTc6TXrN
         6F+NhP5/XJvAm43r4DtKgLJKrIQdkaDHEc0mPQ93XMqXBGNkrMNC03IkDPFVluUDzPIL
         lifoPYgQF0DAkq8ODr4Q13bFNDy7hqV6C+6nHPKosvU/qdl65NRyKCvFGegmFPj4X0Z4
         PcWX6bZZTrKmuD1mfDC/fE8q4fgVx7WnJWC20/onBBY7Jum9WR40qcRhlxE0TW3b4QiY
         iPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772960789; x=1773565589;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hs7hPfZchDfkvHX8fv1Yt61YddgThCI8nWKUUUU6CWs=;
        b=jlVEf3lusbRjWuQXZQUJPL7zT88vZANLrRcPDqthjaCJxF2CWe33D15sFH2Clu2V1T
         DR8WFubgLy+y22D9PQ8qlUv2eSBj42KcjYN54K83WF/Ztf/ZyhN4KVx9NweuTO/R4T8v
         DdpWNWiBrOEQvEQVCswZOcPV25Ak1b+cCCCHGqLCV2EIvHc2nrk+ZDRRfuziT/MXvQAj
         U3RZ5CjwDsKtgzG5EYmRDhkWTFIHCp+Du/oqisKpak8XIUCQgwYlF+UlKo7w6BiYymSF
         M+WTiM6uH2bwuZjJfXRyetig/ZX5fd7a7sHDHREdLZOY2JVUqCEX4weAbUf8mIpJ547I
         a8nw==
X-Forwarded-Encrypted: i=1; AJvYcCXP6TFNKfI7MvtGTlSg9I6wzqNrDlVGQPNRCcsfC5YIBmgJl5sDT4wMT7hzJBLNtxS3MNFnEigZ/H0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2f1xh1jqtzOE/P7DHuHsxoCtMM2sea2a+8KQoBQIDydQqvJmr
	nwwWo5zBVUf3IsSwWMLA5L9gvU5YCcF8rl4qklDbD0PDC3/BU6XPuMfk
X-Gm-Gg: ATEYQzwxr5tXibYa6yeTnLVsiN0qpmMGwHFpgBf0Y69S/lM4uIQj3Sw5xEqQ7JUKi1G
	5+ukwBgFRcA7lK0OumodbHkEWJ1mAXzIoDwteAl1RwmV4UeFtGOFtsr5fSjtFvufQqsmBCFwPvK
	xz0rryW5hJio7/DmT6EL6wOcTmD5ceC7w6eMH/ybpKcB6+6XwyajkWJ3rPEuH4cSnsfL5J1GhC5
	3Mb3njVVf88HAzoDWFA9MVWSnofVWG6esLxGk4Ywmj5VjQCy82LrsBa/MrM2Yy10jkNCq4WhBG3
	LYLO1ApCMnEuj7b8HdqjwysRA2/2HdZuilvvOJa0Fzh+9K96M7vK64NKKYdmnYL9HrgoL6BxB/F
	6Me4HvVzAHVWIa6VwXbG/VaPBcFz+nhm5/5XEaYpE64rkViZ38U2fSv+gpdAX0jBDfP/4965Wnk
	ZffE7cOyFwsTQN83vesQNUhTjpp3CkrCxEX+6Ncx1xRw==
X-Received: by 2002:a17:903:11c4:b0:2ae:47f9:de12 with SMTP id d9443c01a7336-2ae8251b8famr80857345ad.46.1772960789007;
        Sun, 08 Mar 2026 01:06:29 -0800 (PST)
Received: from [172.16.80.107] ([210.228.119.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f74e7bsm73369025ad.46.2026.03.08.01.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 01:06:28 -0800 (PST)
From: Ryota Sakamoto <sakamo.ryota@gmail.com>
Date: Sun, 08 Mar 2026 18:06:20 +0900
Subject: [PATCH] kunit: Add documentation of --list_suites
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-kunit-list_suites-doc-v1-1-4ccd7641a484@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3ezSvMwS3ZzM4pL44tLMktRi3ZT8ZN1kg6Q08yQjEwujFAsloN6
 CotS0zAqwudGxtbUAS3IAQ2cAAAA=
X-Change-ID: 20260305-kunit-list_suites-doc-c0bf7b2482d8
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Gow <david@davidgow.net>, 
 Ryota Sakamoto <sakamo.ryota@gmail.com>
X-Mailer: b4 0.14.2

Commit 60f3ada4174f ("kunit: Add --list_suites to show suites") introduced
the --list_suites option to kunit.py, but the update to the corresponding
run_wrapper documentation was omitted.

Add the missing description for --list_suites to keep the documentation in
sync with the tool's supported arguments.

Fixes: 60f3ada4174f ("kunit: Add --list_suites to show suites")
Signed-off-by: Ryota Sakamoto <sakamo.ryota@gmail.com>
---
 Documentation/dev-tools/kunit/run_wrapper.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index 3c0b585dcfffbd3929d0eef1ab9376fa4f380872..770bb09a475ae799d9247d4c5558fc3306b9cd64 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -336,6 +336,8 @@ command line arguments:
 - ``--list_tests_attr``: If set, lists all tests that will be run and all of their
   attributes.
 
+- ``--list_suites``: If set, lists all suites that will be run.
+
 Command-line completion
 ==============================
 

---
base-commit: fa2c3ed5f079d41db0433a8dc829b9f6fb408aaf
change-id: 20260305-kunit-list_suites-doc-c0bf7b2482d8

Best regards,
-- 
Ryota Sakamoto <sakamo.ryota@gmail.com>

