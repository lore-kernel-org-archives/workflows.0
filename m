Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB114BE439
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886959; cv=none; b=s2BGjW3+oArUsU8Yk+eYViNGWxLGWMneM7zPwOsTfdW9Tu7y5/IvFGlKj8ERfIu4xbrFHYrit+V65t9bh9mEJRJp78RWYonSeSz7vVBO0nfOLYglQRK3vlaH/bHBy6fDoewinfssNWg9MCI7XWgGZJXasP1xwpLVVxt+xowej8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886959; c=relaxed/simple;
	bh=aXw1L7g/upf/F3tnOXBS/dAE7Az9MAaw8sM83XMWJFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKXP++IySTVS6VJ1h2nU8KEJ4rh1zqZCzjuoUSw34ioDDMpblkV9zmKn6gpZmQO4qviHw0B6HMgMuRCPLCKWIJ64S/zAemiAK3+CxQSPau08KCTrugsrfHx8pvx66lEacbRXfF79MTTv1QFRrCQzsGXGSINC+sVPjN1x26ZK9BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbaTtQFQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbaTtQFQ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso484920a12.1
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 03:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886956; x=1792491756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNO0S4V3NLwBUeXdjMEGGTCuH76HrYE6Qlz+uekWGHI=;
        b=XbaTtQFQpmJeNKVahdkVQpkwCQt8mF9fF2MisEpwkYSWbeeXxYJjCIIe9iJ7NzcP2r
         F8hmSHiBT7NI5yqhaRMXio83I7th11+8Z/IjyVYpzYLO+BL6A3N309/YsTD08UO/jg/k
         LyYLWGDQ4z+MXuAujoYfzBCRFrCH+Rq9ZeiCJkmIaocky64U0OSQBElarD1EdGfj8e3h
         qI3uC8jyrPbneUf95gJmz1bF9JmplE8miSTAFZqCcIVt+ZQlc+aMB0ZB6FUJ6DQmIZNx
         byiEZzYgEdootKWbC3yie6ScWhEMcONLSXJIeWYu6VCv9I9IXUBtsKjdqvP0+gb4jTYM
         p1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886956; x=1792491756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNO0S4V3NLwBUeXdjMEGGTCuH76HrYE6Qlz+uekWGHI=;
        b=nEQxjvEWXjh4yMesgRXd+84q1CUskc8wC6p1k9DYTzNk5JTaZlAHpIPHEFZsLwv2ON
         Ohj0AFr17SrJtW3BXeVxFX1kPq93FKEGXBsLNMPlblDGb+1M77XZcGi5JYJuAfJptsO7
         nb9ZWAxaNe4VzbCH241uiGdoihop9ylCT3ydHa53F0eYHHDyaAu/jwvebpwdnKSBf5Tg
         vd8x1o1c75vtyHFL/SKN6Ak295Z9gCQ35oZ+qIb0nuKa0jBA8CmGW1oLZbBB55T1mKWb
         lY1VmScOCbtW1/AVxx8VYuH5z2bhC1GJ58kxeujmc8ewAvM9SkZVrKQebTtks3kyd954
         S3mA==
X-Forwarded-Encrypted: i=1; AKwUvBz3PveeN4G4W3SW98v1CS8uX89ibmnmARDE728NJZbXWZAUQJuxa7Ea/mqMRyFoNAEeYa3FdTxlBko=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq79TqgrzrZ9Fe8ARUYqyXpNEMcVH8+NQsijI8VPwiXEclsOZJ
	Vx3JV2smcoDtU7VNTEhSI9IWl+bVyeugQyIsIiM1q9PUufeRDdgYATJy
X-Gm-Gg: AYBFou0cAk5CKFnnrT+FpzQhLGMd/ZU+43qR2tyN1fYz5jddGOspjDrlJMvBO8ACx5W
	e/oAN+UL7ZjD3w6RuT+zzZepOZ1WbEqAyIBcR56U1I3uMuKVJq6hirabQWitbM4VNJz6nueno5U
	mcfEQIS8T7IvZymZp8kZZV+GRPKSRmO1tu2AYX42knoWJscr4PXpR4I5wUmy+ahGTSNIYpIryWu
	kLS4bsM13jzz2qCJnmu68vCac9Oxl5LMdY3OxVKOihIx9wuHcr3ilmOCdW9bYY+jVOECmNIUT6X
	mIxpUJBx5wmqpqkbwwNttUMKSqO26GIoA7ZmM0xP7r8gwkc4PdkMXZtmUh4UWgKqafreH4vcwAP
	BtQf/jcL4q9rPZ8DODGZsIbIiBxQblg15Md3NJCiLjMQu1hwAXqWBgHC83nfhJ1iQ85jwu51ZYx
	eSCONaw766U5aNPuRJoOEiiYpa6hRGCowI9lskSaLkb7a9bxMQ0M/jEuSEYe++AuoBXDTJ9DycR
	yb/pv2+4M/bv1aUT63elgnvGVWwfiv6PA==
X-Received: by 2002:a05:6402:2348:b0:6ae:a675:62dd with SMTP id 4fb4d7f45d1cf-6b17c2bfb46mr10924005a12.42.1791886955466;
        Tue, 13 Oct 2026 03:22:35 -0700 (PDT)
Received: from [127.0.0.2] ([2a05:f6c4:d34b:0:eb4c:5610:e9e4:9d1e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm230739766b.42.2026.10.13.03.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:22:34 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 13 Oct 2026 12:22:24 +0200
Subject: [PATCH v3 4/4] Documentation: kunit: add documentation and
 examples to kunit documentation
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-lockdep-kunit-v3-4-cdb8ff720c1f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886944; l=4664;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=aXw1L7g/upf/F3tnOXBS/dAE7Az9MAaw8sM83XMWJFM=;
 b=197PL5sRImc434TSktPNDLm91sYqlCMcYaOqmobuwHoZ5KhTY6cLKelkof6ky+vRYJbqrT+m1
 xtS9GuurHSRCR2QUeq6SU8ntr6qrQ23Suo3a5TjE/CC+RL85z9iqllK
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

add documentation section to Documentation/dev-tools/kunit
named "Failing Tests on Lockdep Reports and Kernel Warnings", which
explains the additional configurations namely:
CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP and CONFIG_KUNIT_FAIL_TEST_ON_WARN,
when and how they are useful as well as an example of an invocation.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 .../dev-tools/kunit/failing_on_warnings.rst        | 78 ++++++++++++++++++++++
 Documentation/dev-tools/kunit/index.rst            |  1 +
 2 files changed, 79 insertions(+)

diff --git a/Documentation/dev-tools/kunit/failing_on_warnings.rst b/Documentation/dev-tools/kunit/failing_on_warnings.rst
new file mode 100644
index 000000000000..cf502995368b
--- /dev/null
+++ b/Documentation/dev-tools/kunit/failing_on_warnings.rst
@@ -0,0 +1,78 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================================
+Failing Tests on Lockdep Reports and Kernel Warnings
+====================================================
+
+By default, a KUnit test only fails if one of its own expectations or
+assertions fails. If the code under test triggers a lockdep report or a
+``WARN()``, the problem is printed to the kernel log, but the test still
+passes and a bug is easily missed.
+
+KUnit provides two optional config options that turn these problems into
+test failures.
+
+Config options
+==============
+
+``CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP``
+	Fail a test case if lockdep reports a problem (and turns off
+	``debug_locks``) while the test runs, which is useful for any test
+	that takes locks. Locking bugs are reported by the test that
+	triggered them. Requires lockdep, e.g. ``CONFIG_PROVE_LOCKING=y``.
+
+``CONFIG_KUNIT_FAIL_TEST_ON_WARN``
+	Fail a test case if the kernel becomes tainted with ``TAINT_WARN``
+	while the test runs, i.e. if the test triggered a ``WARN()``. Since
+	a warning usually indicates a bug, this is useful for any test that
+	does not intentionally trigger a ``WARN()``. If you trigger a ``WARN()``
+	on purpose use ``kunit_warning_suppress(test)`` otherwise your test
+	will be marked as a failure.
+
+Forcefully skipped tests
+========================
+
+Once lockdep has reported a problem, ``debug_locks`` stays off, and the
+``TAINT_WARN`` taint cannot be cleared. The kernel is therefore considered
+unreliable for the rest of the run, so after the failing test, all
+remaining test cases are *forcefully skipped* instead of being run.
+
+A forcefully skipped test case is reported as a skip with a
+``force skip:`` reason, for example:
+
+.. code-block:: none
+
+	ok 2 foo_test # SKIP force skip: debug_locks are off
+
+Unlike an ordinary skip, a forced skip does not mean the test does not
+apply; it means the test could not be trusted to run. A suite in which
+at least one test case was forcefully skipped is reported as follows:
+
+- **Failed**, if a test case failed, and the remaining test cases were
+  forcefully skipped as a result. This is the common case.
+- **Passed**, if the forcefully skipped test cases only follow passing
+  ones. This is rare, and implies that something other than the test
+  cases themselves triggered the lockdep report or ``TAINT_WARN``.
+- **Forced skipped**, if all test cases in the suite were forcefully
+  skipped, typically because an earlier suite already left the kernel
+  unreliable. In the KTAP output, such a suite is reported as
+  ``not ok``.
+
+The suite statistics count forced skips separately as ``forced_skip``,
+and ``kunit.py`` shows such test cases as ``[FORCE SKIPPED]``.
+
+Running tests with the options enabled
+======================================
+
+The options can be added to a ``kunit.py`` run with ``--kconfig_add``,
+options CONFIG_KUNIT_FAIL_TEST_ON_WARN and CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP
+are independent of each other. Here is an example of running kunit tests with both configs:
+
+.. code-block:: bash
+
+	./tools/testing/kunit/kunit.py run \
+		--kconfig_add CONFIG_DEBUG_KERNEL=y \
+		--kconfig_add CONFIG_PROVE_LOCKING=y \
+		--kconfig_add CONFIG_KUNIT_FAIL_TEST_ON_WARN=y \
+		--kconfig_add CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP=y
+
diff --git a/Documentation/dev-tools/kunit/index.rst b/Documentation/dev-tools/kunit/index.rst
index b3593ae29ace..bdef2913da36 100644
--- a/Documentation/dev-tools/kunit/index.rst
+++ b/Documentation/dev-tools/kunit/index.rst
@@ -17,6 +17,7 @@ KUnit - Linux Kernel Unit Testing
 	style
 	faq
 	running_tips
+	failing_on_warnings
 
 This section details the kernel unit testing framework.
 

-- 
2.54.0

