Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E419437846;
	Wed, 19 Aug 2026 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146892; cv=none; b=iqXMopUoihD0PR3tEgAxR8DS3uFk8C/SCYPZ+vOp9vClMXMhAlolsjD/mG9BXoBdjoFlYQHTDW4fJ1V/VhnDm0ncFCzMGptD5Mjdh/iVf2mmobhfEWo+95JGqlYxAVcyKZzzqZMgGReVk39E7ZE+bGl78+wA0cD2KHT3VNqcQuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146892; c=relaxed/simple;
	bh=GVNIfzOWjURxXcaf/H66mujwIAWitdrkhZ5E2Iz8sYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ts/eoCS87vDsR95uuzofzqU2004SSNshn1Wgd701WAr5GPP1+0Ld3Rmvmh3e6CoFglcv7o7KNsE+Eb3L2WgiLbXBYlI4zew5isAjBbhqyewF4MsTvHlC9sL678DW8yR4EbxBA//+S2l+P6YkYP2VxskgJlqbxcJtehAEg4OwkPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PC447qCr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PC447qCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F221F00A3A;
	Wed, 19 Aug 2026 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787146889;
	bh=eO8Z6DIyi7LTcl+hgovHauXM4WisvfWUCh9I38Nciw0=;
	h=From:To:Cc:Subject:Date;
	b=PC447qCrxnsW+J5yEMe3y17TNx8fuWUF9xZ8+yo81alttRqHtLIb6fij68mJzVHsY
	 B9QzOrjqhgXQE1LRZ2YkVjw6mu1GbAj6oORykMt0dDxHZ4KPo3MbgjFdOj2+hUlCJs
	 WKkfJsHhccS82gyQ9lB85vUA9eQCoa73sJ2N+wbWdobqS8FJzUQdr4Wi7O5ELCa9q/
	 sLVa+00ICEL40JtIORHTk3u9qqQEyeh1wfTxnOVal/Msp9h8f4D+widSYEcoEbRgz6
	 9ICGKdczCpfm9gM23FITKEqSQOU+jQuc4brsz0F4ysZnRP+0C+PxXak2XOSOJo5PwA
	 1kb74v9Mprgwg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wwgXn-00000001Cch-00pN;
	Wed, 19 Aug 2026 15:41:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Willy Tarreau <w@1wt.eu>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] docs: threat-model: fix /dev/kmsg reference
Date: Wed, 19 Aug 2026 15:40:39 +0200
Message-ID: <20260819134039.286793-1-johan@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a '/dev/kmsg' reference which got replaced with '/proc/kmsg' (which
is not accessible to regular users).

Fixes: a03ef333fbd6 ("Documentation: security-bugs: explain what is and is not a security bug")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 Documentation/process/threat-model.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
index a68be888ce8e..04e5df6a6f78 100644
--- a/Documentation/process/threat-model.rst
+++ b/Documentation/process/threat-model.rst
@@ -84,7 +84,7 @@ possibilities of user namespaces are not covered in this document.
 The kernel also offers a lot of troubleshooting and debugging facilities, which
 can constitute attack vectors when placed in wrong hands. While some of them
 are designed to be accessible to regular local users with a low risk (e.g.
-kernel logs via ``/proc/kmsg``), some would expose enough information to
+kernel logs via ``/dev/kmsg``), some would expose enough information to
 represent a risk in most places and the decision to expose them is under the
 administrator's responsibility (perf events, traces), and others are not
 designed to be accessed by non-privileged users (e.g. debugfs). Access to these
-- 
2.54.0

