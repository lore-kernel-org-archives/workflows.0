Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B647607D
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 10:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886957; cv=none; b=Ag6Sb6/7nW/2Q1YqCiST2+//exQ4Y3m6XcwyLykZF+P4esaxW45mbCQpmZQT3yPXHrHfPL8CTSlY82woQc1/5KOGO6NNyaPElB6tUWxnavWhOeCr+7G+Z5c+/2bGhtA3DswdY2wWcKF7YIXs0KuG7n/3S3VznUq3bDWWDS8HaUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886957; c=relaxed/simple;
	bh=93xC3/upfsa/twJxPDQzew/ko1gX/yS9rNw89pYITeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CVZY7XOf8lDK1LXEcJXOPl3UQXcacah3syQXuCeQCM/YJy4Cof4Vvyd3anmMa3Escgw0f6y3mgoTJDSqCEr7P3bWkH26b9CmFKkzYKw54IUKqnL1MoDH+hX8/6HMW0Scbd5sAN2b7eN73ffKO0CUkE3E7MKS+e+Q8xuiIYDXBZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfIh5/+S; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfIh5/+S"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so2566453a12.2
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 03:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886954; x=1792491754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7clhEis3l5vh76pGdzr3b2EmsBU2JfvAO16ToGyoS0=;
        b=SfIh5/+SkjKmQ2Jh7X15wUMX2+aJ1bixo8jnJPeY889SzYyu8GNbSYLL9RzQzyTGL2
         ksTsiI6J/b46ZKJhH0WtyJhc84U7JQl+V34r08MkvpceFaGo7wj75d8oIm/jeGQLIcN0
         KPdkF1WdMPMBQDXPHg+5+2rFWo8YYX2Nc+02gQkjriD5vpLQr4jIzvJ22/b2w+RNfLqA
         fsCCNE6ga+td5Uwt1vDvJYm7RuvDri4MKTpcBofZAzaNFnoCPV58JrdossKDtLn2IC2p
         3vv8g7QDpEpHcZRYx20lIuS+LHMqCxMAW8vIMMtScKkY/HkUUCxm2hj86w4yC7dvyN1B
         +b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886954; x=1792491754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7clhEis3l5vh76pGdzr3b2EmsBU2JfvAO16ToGyoS0=;
        b=pdchFRyTBfpzobQ74nGiQF1kYLpYxWrXL2Q6e5GnzN3qZy8g46lTdjXpPja834FImR
         oCcIe/R3pQtlGWt+lzIT5SiOnhTgW58Mt6p79QGktDkeccE8b07zAZYIRs29suxtFo67
         JWv9QJWHCBe6kCdtfdzRBWwqdI69744ngQirHKCtxTGNl9CHDRAJWYNX/lRDpBK6PhtP
         yNog5qKqbyv2pyoApEtOKbqfCRHw46mAd77kIXai6dgKgvGZz9po6OX9fT+T9GAYHlEa
         do27DcnUgXjr07FeAlGGFLno4Edc3A9G3cI6jSuCQKvHA4lyvKxeuza22ig88T31r33g
         E+vw==
X-Forwarded-Encrypted: i=1; AKwUvBzAhkcmXPfePwaYWnb8m6OqbtoMmMYZa6qViXWrkyfFWOSTsZCTtC0UYzXtWroIjIqbDL9bx+4sLJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRHnBotlTM+0iUO0fn04nYPdb3TE3q1eV+A9+ZXDk/aToZ0J1p
	WEFKIBi3xxdfOO1h26SDmHcYJJ5xMXqvlyWgxdzd9d3ZgSxajbKadejw
X-Gm-Gg: AYBFou1Ea/NgsiNo9nifaKBmBx+20jjiK9L/v9eizrEu9J4SIepBrvqZSuBATFd50cj
	/K7Cwcn215UfjjsLsO68dkq/elSeUFzwoAIfMWl9oGCfxTlw5ti7N72k5gxMi3E4UG+qa1v8apu
	33+mLwyhsUx/qNkXEmSnvlRyakUXfKR9qN0V7W7OSv5F1xkRfXa2SzvjjCDcyZSO4sIw20x+54K
	ZdQwwT8tLC14sljUlEPSmcQXCBSebRbsVRaeoO43gF3U5mO0eHmtTVwUvgcd8Q6mmMTXv1CWEsw
	ZlgH2S2hBJLA4Ola8gd6z7Obp/EUNqXdgnlCYfcncCDAw0onUXDa77PlOdyOxKLzy1JXI6inuEI
	dWReQdkKdYkylnqdOytHRpOYsFp23fFXEqMDn5t3eznoNl3+th9iSpvEEZCzuCKVIpDPq4AJo1C
	7VD72XejelLgEe/FEYU+j3iVvE2vQ2+v0W/astOctWsAhP/4lD2UGBucXbKy2cHyf+JRAm9ZO1o
	n2w2cSDLljulBjA1GYiyEQ4UAkWmqbnpbw=
X-Received: by 2002:a17:907:2da9:b0:c31:82aa:dd47 with SMTP id a640c23a62f3a-c31aa017e24mr1179807566b.44.1791886953580;
        Tue, 13 Oct 2026 03:22:33 -0700 (PDT)
Received: from [127.0.0.2] ([2a05:f6c4:d34b:0:eb4c:5610:e9e4:9d1e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm230739766b.42.2026.10.13.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:22:32 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 13 Oct 2026 12:22:23 +0200
Subject: [PATCH v3 3/4] kunit: add assertions for TAINT_WARN inside of
 kunit
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-lockdep-kunit-v3-3-cdb8ff720c1f@gmail.com>
References: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
In-Reply-To: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886944; l=2647;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=93xC3/upfsa/twJxPDQzew/ko1gX/yS9rNw89pYITeg=;
 b=E4/SRkMIxWTOqpH4QGDb4bSD8sDdigI2DpKpj0JtUUCDX40gIqrqWG97Yt2KATqvDlHYDk5dB
 oaUWhab4BnzARRDlv8e6XKVuv0jCqx4cBBdD2bwv/9iyL4HDhSSiFpD
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

Assert that the kernel is not tainted with `TAINT_WARN` prior to running
a KUnit test case, and assert that it has not become tainted with
`TAINT_WARN` while the test has run. If this is not enabled,
writing and running KUnit test cases that trigger a `WARN()` does not
fail the test if the test itself passes. If enabled, it marks any test
that triggers a warning as failed, and forcefully skips all proceeding
test cases, since the taint cannot be cleared and the kernel is now seen
as unreliable.
The assertions are gated behind `CONFIG_KUNIT_FAIL_TEST_ON_WARN=y`

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 lib/kunit/test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 1292a0799c33..6d6f1e947db5 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -81,6 +81,30 @@ void __printf(3, 4) __kunit_fail_current_test_impl(const char *file, int line, c
 	kunit_kfree(current->kunit_test, buffer);
 }
 
+/*
+ * Fails current test if TAINT_WARN has been set (changed) after the test has run.
+ */
+static void kunit_check_taint_warn(struct kunit *test, unsigned long tainted_before)
+{
+	if (IS_ENABLED(CONFIG_KUNIT_FAIL_TEST_ON_WARN) &&
+		test_taint(TAINT_WARN) && !tainted_before) {
+		kunit_err(test, "Test triggered a kernel WARN");
+		kunit_set_failure(test);
+	}
+}
+
+/*
+ * Skip a KUnit test if the kernel is tainted with TAINT_WARN.
+ */
+static void kunit_skip_if_taint_warn(struct kunit *test, struct kunit_suite *suite)
+{
+	if (IS_ENABLED(CONFIG_KUNIT_FAIL_TEST_ON_WARN) && test_taint(TAINT_WARN)) {
+		suite->forced_skip = true;
+		test->forced_skip = true;
+		kunit_skip(test, "force skip: kernel is tainted with TAINT_WARN");
+	}
+}
+
 /*
  * Fails current test if test turns off debug_locks.
  */
@@ -487,6 +511,7 @@ static void kunit_run_case_internal(struct kunit *test,
 	struct timespec64 start, end;
 
 	kunit_skip_if_lockdep(test, suite);
+	kunit_skip_if_taint_warn(test, suite);
 
 	if (suite->init) {
 		int ret;
@@ -539,6 +564,7 @@ static void kunit_try_run_case(void *data)
 	struct kunit_suite *suite = ctx->suite;
 	struct kunit_case *test_case = ctx->test_case;
 	int debug_locks_snapshot = debug_locks;
+	unsigned long tainted_warn_snapshot = test_taint(TAINT_WARN);
 
 	current->kunit_test = test;
 
@@ -549,6 +575,7 @@ static void kunit_try_run_case(void *data)
 	 */
 	kunit_run_case_internal(test, suite, test_case);
 
+	kunit_check_taint_warn(test, tainted_warn_snapshot);
 	kunit_check_lockdep(test, debug_locks_snapshot);
 }
 

-- 
2.54.0

