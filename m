Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC3F4BA1C0
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886950; cv=none; b=CMNvkbY/wuxwd+t49QwJNWBUtbDZCtrCEZv9Spy4LG6URAIN/QvPGdTw073u+81PVThNDtMuK5x3x+QrBkCZ4e6/qnzR7SP3rjJTN9bvNh8UnthEoqxnZ2QwWtlFq8iFXQE196iS/inmya2rwbBCCDi5s/dhJOfTuA7BfYL2mXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886950; c=relaxed/simple;
	bh=QoEj15VW5Rz/BMW3IO7hDxn+DIbOJK1iyO5Ue5ss1Cs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nA/jqvQ/mly+i7zja1GJTgjLsa4oQVNZecexHA2RBkKQRLlpuacqEKuaXxm3zUIZotWQsWqqmpkyELiWK6SlTZIR2BzpQRAVbLjwy0mQPosFOQzgGk+6yVBEjVrh2keKUpbDA9WNMyB6ZPOyrICZYPHX6O7ze0cTQ7OAK1wo+kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1gtat1U; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1gtat1U"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2055573c8cso328288866b.3
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886947; x=1792491747; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jof7IVRuzH/+jDJxaXeOI9qqOFJlE7BBc0KXq3UCoT4=;
        b=e1gtat1UroLRRcxrsVgi37cBpcWnug0mH3kSjpDho26Mfz/FaFcxYvyEOJiNdINTWq
         ZmIOzGUyDDy5ZZm8HsF5TaUSPGpCrgNkCJ+WvUvS9uaB0AGn4dLI+dvY99hBbZD2/q0b
         2zCd2hZiO8ijMbJv05Y7OoXlTY/cvJa3X+klzbVDYiumMkODxuHna5u4f21elZojmh1N
         /E7ln/HOgPmM3vsmqAhZ5eQJ4vkIr6LSPkxQizqkJJf3KAa1EDCh+q3jgeOIZHe9BY+2
         DHRQpZu2MBbsMCal1g4Hd3+vxhFtn39IbylkkJhXFdbLbVNPcrV98CaiCXbhijrfTvdw
         nO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886947; x=1792491747;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jof7IVRuzH/+jDJxaXeOI9qqOFJlE7BBc0KXq3UCoT4=;
        b=osfgTAhlhZVsFC40WN2mx66MByVjIJ7JXWtQbqARpvyGRUHWcYWo8h7Hjh1odZB7+9
         NJeLcIjGEqFKMGS7XzNg4gB6s7Bm/oskHPFcM87zjM18RScSvwCEeXVs8at0A0OVBeSd
         +hmGPs8Z+eiIKGO9Vt0glZsq9AL1V2f0sHBbsSQxRO6K561vSBNfikv49sWannJ9gBf4
         aSnjXyHxWC1D9A59puVXVbQWGOvuv7ptRZ9aas7M8K7K6ot2aIoR3Y2vMquTGfeTn77n
         6qCouIJamg7sHGKGUIplB7FJDecbIThEOZosniDMtx3wPEzk1GLQN7n4n+tasefeWxk2
         jqdQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7vKxHIqu8f05CAN+v7R2XFVEIhommZ+SxAwxgKYfP/72A4+vb/lPQeDdJyPAfMzaL38mB4iSCneU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0RMWbjFC6H8gIBroa3QTnluni85PymKYkeae6nTaDlv2RAM8g
	IFKx/9aAoh5FQ5q5SaKDB9MediodpiqsnWfesw3qvERVX1ADnwxvyXod
X-Gm-Gg: AYBFou1GYaleWqn0fnvUPpwRdfuYl2yFNBB9MhGSr982ENOG6fHRC85ZuzmMdo0VgB5
	EzQo+5HqCEFJeigImGQGoL4BA93tcvfs4Q0WncsBkupN0zZmFj+wO6BERdP3W0BHdF6MMyy06lR
	+Po2kwft+Ka2FTGAWtF2LJMBHY4wwF0fcMm/I8DfFVhegGDdbEDfEVoTQ1/dza4BD9h21hsLK/q
	YaNLER4Ja9y7A2gS4y/KYT4M3D7GeEBeMe6UjU1T/orzb6gX12eQU+m3N7Gr43uTGqKjNFDwjNw
	MXFP7xoJi289+FgM4Uj00T25SZanmZIUzP8nGmbKhsfCoLK91+yLTxXsncpraGwKIyH6ITc6yOT
	BPYg9qRNxQS/XLaPA4WBJ5aXoaT/x6j9sM2UPgjKK0BIZRGr/9pLRMEasUvowEjX54+5QGjoq+e
	R6DmZ9FDslsyUXLzVTItLZ7q1wUdGbVmKeFCUIgKwoLQzT/6R7gA/+oSeMaLDw6x+C2As9RcbN/
	mV+XT/XvRrqbhwY3DHI9G1Zgrcua4vr2g==
X-Received: by 2002:a17:907:3fa9:b0:c26:1649:47af with SMTP id a640c23a62f3a-c31a9fb6451mr1167409166b.37.1791886946440;
        Tue, 13 Oct 2026 03:22:26 -0700 (PDT)
Received: from [127.0.0.2] ([2a05:f6c4:d34b:0:eb4c:5610:e9e4:9d1e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm230739766b.42.2026.10.13.03.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:22:25 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Subject: [PATCH v3 0/4] kunit: add optional assertions to catch taint and
 lockdep warnings
Date: Tue, 13 Oct 2026 12:22:20 +0200
Message-Id: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0GzmoC/12NywqDMBQFf0Wybkq8Sqpd9T9KFzHeaOojkmhoE
 f+9iaUgXQ6cmbMSh1ajI9dkJRa9dtqMAbJTQmQrxgaprgMTYMBZkQLtjexqnGi3jHqmJYdC5ZU
 UdclIcCaLSr/23v3xZbdUT5RzjMRFq91s7Hs/9Gnc/drFX9unlFHOJVapgAtgdmsGofuzNAOJb
 Q8HG/J/G4KdccEVylIF/Whv2/YBkM+OPvoAAAA=
X-Change-ID: 20260812-lockdep-kunit-9628f4bcad90
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886944; l=4206;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=QoEj15VW5Rz/BMW3IO7hDxn+DIbOJK1iyO5Ue5ss1Cs=;
 b=5b/OOvl+ou89Y7VAUHkdAROHOd7sy7qPnBmX0MwIedktH3o0E+/260Bci5yCZKa921lNtpGTO
 lPb9LFujY44Dczuh1DGcB4tJ90xjfyYOJ9HcHVqhrBELZYJjM/uwx8n
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

This series extends KUnit to use existing kernel diagnostics to catch
certain locking-related bugs. Specifically, it adds assertions for
`debug_locks` from lockdep and the `TAINT_WARN` flag from panic. This
aims to catch bugs such as circular locking dependencies and sleeping
functions called from invalid context, by highlighting them when they
are triggered by a KUnit test.

Add CONFIG_KUNIT_FAIL_TEST_ON_WARN and CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP,
which enable the `TAINT_WARN` and `debug_locks` assertions respectively.
The assertions are run in two places:

    1. Before a test case is run: this ensures that no tests are run if
       the kernel is tainted and/or `debug_locks` has been turned off.

    2. After each test case: this checks whether `debug_locks` has been
       turned off or `TAINT_WARN` has been set between the start and the
       end of the test.

It is important to note that if assertion 1 fails, something other than
the KUnit test case turned off `debug_locks` or tainted the kernel. This
is not investigated further, but the kernel is treated as 'unreliable',
and all subsequent test cases are forcefully skipped.
For assertion 2, there is no guarantee that it was the thread
executing the test case that made the kernel 'unreliable'. This is not
investigated further either, but as with assertion 1, all subsequent
test cases are forcefully skipped and the KUnit log is shown.

Tests that trigger a `WARN()` on purpose are expected to use the warning
suppression added in commit 85347718ab0d ("bug/kunit: Core support for
suppressing warning backtraces"). Suppressed warnings do not taint the
kernel, so with `CONFIG_KUNIT_FAIL_TEST_ON_WARN` only unexpected
warnings fail a test. Running all KUnit tests with
`CONFIG_KUNIT_FAIL_TEST_ON_WARN` enabled currently fails `Log base 2 of
0` in `intlog2_test`, because it deliberately triggers a `WARN()`
without suppressing it, which force-skips all subsequent tests. Running
all tests with `CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP` enabled does not
change any existing test results.

The new options depend only on `CONFIG_KUNIT` (and `CONFIG_LOCKDEP` for
CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP) and can be enabled independently.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
Changes in v3:
- rebase onto v7.3-rc6
- add forced_skip logic to kunit, enabling marking tests as forcefully skipped
- split CONFIG_KUNIT_EXTRA_ASSERTS into two sepperate configs.
- extend kunit_parser.py and kunit_printer.py to handle forcefully skipped test cases
- make forcefully skipped tests be marked as failed in kunit_json
- add new section to kunit documention at Documentation/dev-tools/kunit/failing_on_warnings.rst
- Link to v2: https://patch.msgid.link/20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com

Changes in v2:
- Implement changes directly in C KUnit instead of Rust KUnit wrapper
- Remove rust specific configs and add general CONFIG_KUNIT_EXTRA_ASSERTS config
- Link to v1: https://patch.msgid.link/20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com

---
Malte Wechter (4):
      kunit: add logic for tracking forcefully skipped test cases/suites
      kunit: add assertions for lockdep inside of kunit
      kunit: add assertions for TAINT_WARN inside of kunit
      Documentation: kunit: add documentation and examples to kunit documentation

 .../dev-tools/kunit/failing_on_warnings.rst        |  78 ++++++++++++
 Documentation/dev-tools/kunit/index.rst            |   1 +
 include/kunit/test.h                               |   4 +
 lib/kunit/Kconfig                                  |  23 ++++
 lib/kunit/test.c                                   | 135 ++++++++++++++++++---
 rust/kernel/kunit.rs                               |   1 +
 tools/testing/kunit/kunit_json.py                  |   2 +
 tools/testing/kunit/kunit_parser.py                |  36 +++++-
 tools/testing/kunit/kunit_printer.py               |   3 +
 9 files changed, 258 insertions(+), 25 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20260812-lockdep-kunit-9628f4bcad90

Best regards,
--  
Malte Wechter <maltewechter@gmail.com>

