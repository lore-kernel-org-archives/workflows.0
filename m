Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B285C4BC00B
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 10:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886955; cv=none; b=mwPdCZG5gZi2PNDmldeYKcrdaqRwhDYozcKxZo337+khojhiU04uNRvR1CYSipNtUT8TKFZsD791xM5z09nSFC26QaQmCipW/LaErl5QZFbo1payRlqChvBF2IlvhAVmcxjoHkwF0cerlcOE51mdZYcSqXk0PCOYlCn3qqVg67Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886955; c=relaxed/simple;
	bh=2mda2/w8AjN8jnKUaMwvix7N6TVg4/7UD4J37iK+TiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZZW8kbLtLpeISSz0RsVpbvmBDfxF6qaGQsDyqWkQ/Qd/v12+Piz+3fVsR9Q9rqvyYnDtMEk/QYZR7jT/JmmUn+lnjX+6xeIjtOeSqz8ADOFAUKM63PiSsI+eF1ltwhwHeHvAxnwpV49wYvuQWZvqd6FPWaFFi4qcyUNQhvMFmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWaA+Ijw; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWaA+Ijw"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so3036247a12.3
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886952; x=1792491752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCyfvNJyyWCOyv28in+aW8lLFWLZVEY3hCHsrsMENqI=;
        b=TWaA+IjwRty5h9fUh3LiSBxcvJy4RorpCkIl7Yaro7PTXwU+PsPWFZ7KSE+ulCkB3W
         lwkanii2p8HwcIsWMxEzLZD3bJ/p0uIvHAC4WB+AhDi+EqdBpRn90voCTySo7vhxuCge
         IiOK9OIAiS0h4alii9w4iFSVLhr9XIzKWvScXayOqLU0rCeZPqYmaFkrjxatkzw0ithz
         rSHy8TwotuawJXwIBYZnfSMCwN+MPV1J7wMCWQnOr6qll6yCOrqq2+4AlDEfwBEOtvNA
         PFxf/lk6crgSE9WM9uhXipi51gEV+0+daUVP0NxwjyQ+80tDn7lCv9jtERZDs88fmwL7
         usUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886952; x=1792491752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCyfvNJyyWCOyv28in+aW8lLFWLZVEY3hCHsrsMENqI=;
        b=LpjUBUaIa9GW/tBIIaXzw+jO8zRUJd/3t9cERSvSyOCl4KhmoNGbo4MX65DCD+MZF3
         BJtt2ZSa1merNTtPhLB2UCGXZlPowUnfP57R/n8xDOfRlupMSWeM3MPfqBtj5RKpXlRZ
         pBBvd8sChwyMFO0tBnPcLSwzPkxAs7kD3scCHek/8AbCOw/vbGu1HDyIPptYtQv3DTlr
         KIvlMPtFNWt6sO/mZH29bPkt9+11MgCBhk0WWg/5GABBdv0B7SsEXYU/t5nPV2lM3IoV
         eCb7eTIHJq4+ntPoqo8KUrB/dY1i5mAOXsgdtzQtOY0QnKDjsS5mLGBnIgwo7Cx6ECYZ
         fVDA==
X-Forwarded-Encrypted: i=1; AKwUvBxQllaIMevEaOHu1Fn+etZzjaiaWZRO1TV1i88melYO5T4MhZMz6C3Ty+rh2JMs5vKpmBxdLFEpFn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEEMOLvj3+Vxhy47cO2pVYIjVfiRrNoeXC6g/BKLxKGsG83o74
	wisqIf8XjWjWlFnes8xkIJN/NNZ+cQHLg6EC5eNbQ4HLvu/9josYC3kR
X-Gm-Gg: AYBFou2SHMa5q5hEHVz2J8uxYpHI0WseLGC4dcjTWGRdfBW2x55WojzhMh7eCOkI3Su
	Rl3tR6piAmddR0Sh1wJU33UAtlZXNuHEqpoPJVhhZeg7QpRlbWiycxDiZZIKjg0nCdm7F2V69LG
	Iavflj0XzTNriJbYMsQM/MxT7mWaqcpWtRTE1EGBM4SZh9oAK6aSeqlzidGUDU4PEyogPXldaby
	87dOWd6W9GXcvbFZfgInXsCAx07pATvNHIKggo6K245/Lv4+GNfdiKNkQ/KVA5DqdSQQvkkO4AY
	Vax+VHzBvMEbWLmx+h+g39ZBFhAK49fwgdfn+jqtXSGHVh1X915o4kGCguN/V5DaYwJY/WaWY62
	0Ia1/Hzap22UEPtggyKOLSJiclkiF1C/lBaIWEQrUlqPzMBWdqRKRKoI/In0dJ3593/YVCXOaq8
	EiE7JOpsvAJEy5D2I/EnVv9QMSBmXwX9icqIJUQ15un3MYqe/h0ZaIJYXXyLO6OoGzdMXn0Lnrk
	OLchuXNwTrD/+CFw2xAU7byY/shOVT7kw==
X-Received: by 2002:a17:907:1c93:b0:c2e:3d29:a5a0 with SMTP id a640c23a62f3a-c31a9a077ecmr1177052266b.3.1791886951684;
        Tue, 13 Oct 2026 03:22:31 -0700 (PDT)
Received: from [127.0.0.2] ([2a05:f6c4:d34b:0:eb4c:5610:e9e4:9d1e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm230739766b.42.2026.10.13.03.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:22:31 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 13 Oct 2026 12:22:22 +0200
Subject: [PATCH v3 2/4] kunit: add assertions for lockdep inside of kunit
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-lockdep-kunit-v3-2-cdb8ff720c1f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886944; l=2944;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=2mda2/w8AjN8jnKUaMwvix7N6TVg4/7UD4J37iK+TiE=;
 b=83KoWQOgs0rSGqsETeICKKRaxUfu6BR2dUGAYusaCo5tN+Eb4PHmWQdUbad4Kt1RBBdjon6lS
 Ha9D4rY1xG0ByT2JUGVAg3fdndu9xv9kaYCQrtXnmER3mnRGPYKuUx6
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

assert that `debug_locks` are on prior to running a kunit testcase and
assert that `debug_locks` has not been turned off while the test has run.
The assertions are gated behind `CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP=y`,
if it is not enabled, writing and running kunit test cases that trigger
a lockdep warning does _not_ fail the test if the test itself passes.
If enabled, it marks any test that triggers a lockdep warning as failed,
and forcefully skips all proceeding test cases, implying that the kernel
is now seen as unreliable since `debug_locks` are off. Failing a test
when lockdep reports a problem is useful for any unit test that takes
locks, locking bugs are caught by the test that triggered them,
instead of being silently logged and missed.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 lib/kunit/test.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 0e3ed457daca..1292a0799c33 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -6,6 +6,7 @@
  * Author: Brendan Higgins <brendanhiggins@google.com>
  */
 
+#include <linux/debug_locks.h>
 #include <kunit/resource.h>
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
@@ -80,6 +81,29 @@ void __printf(3, 4) __kunit_fail_current_test_impl(const char *file, int line, c
 	kunit_kfree(current->kunit_test, buffer);
 }
 
+/*
+ * Fails current test if test turns off debug_locks.
+ */
+static void kunit_check_lockdep(struct kunit *test, int prev_debug_locks)
+{
+	if (IS_ENABLED(CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP) && !debug_locks && prev_debug_locks) {
+		kunit_err(test, "Test triggered a lockdep warning");
+		kunit_set_failure(test);
+	}
+}
+
+/*
+ * Skip a KUnit test if debug_locks is turned off by lockdep.
+ */
+static void kunit_skip_if_lockdep(struct kunit *test, struct kunit_suite *suite)
+{
+	if (IS_ENABLED(CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP) && !debug_locks) {
+		suite->forced_skip = true;
+		test->forced_skip = true;
+		kunit_skip(test, "force skip: debug_locks are off");
+	}
+}
+
 /*
  * Enable KUnit tests to run.
  */
@@ -462,6 +486,8 @@ static void kunit_run_case_internal(struct kunit *test,
 {
 	struct timespec64 start, end;
 
+	kunit_skip_if_lockdep(test, suite);
+
 	if (suite->init) {
 		int ret;
 
@@ -512,6 +538,7 @@ static void kunit_try_run_case(void *data)
 	struct kunit *test = ctx->test;
 	struct kunit_suite *suite = ctx->suite;
 	struct kunit_case *test_case = ctx->test_case;
+	int debug_locks_snapshot = debug_locks;
 
 	current->kunit_test = test;
 
@@ -521,6 +548,8 @@ static void kunit_try_run_case(void *data)
 	 * thread will resume control and handle any necessary clean up.
 	 */
 	kunit_run_case_internal(test, suite, test_case);
+
+	kunit_check_lockdep(test, debug_locks_snapshot);
 }
 
 static void kunit_try_run_case_cleanup(void *data)

-- 
2.54.0

