Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AA3279DD8
	for <workflows@vger.kernel.org>; Mon, 15 Sep 2025 19:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757964192; cv=none; b=GPduOOizziaI8MaKuY5deptRhDBMg2dBZui4HfLfAY9sogyIV5TEQ1RhQP7NIruNuOviYdINNh2rU1WaL4BjpywiwLzfvku2vNxI5ZI3HU5Y09RMLFJ3oMjqOaNppIu0u3MHhsgVZ2C5OB6vTIkzMbv2tq0c15lOm3LqS5ZIO1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757964192; c=relaxed/simple;
	bh=W8Q38kFVsBIoz8sNsqTlUe7KEtxqSfJERsmB70nLqXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AM5G4ip6pQDV11Lt1mLTAc4RNq1eBh8xTZvSSz2Bsi+PIN1/0KM52DJU0x5EMYDwERcsQG2leStNgkv+aSPMxX26tvvmUWTk+yk6SyR2lozDBYURg6NqmhEhJ5OP/xT0W8V/+0E6CozAz/GvVmCygL5Izrivo/gFv6y6LubMufk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LmPF9JVO; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LmPF9JVO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757964187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iN6AS850SFtDs7hMHQsmgAQjrwDZ6R8BHKVWKsXsyGo=;
	b=LmPF9JVO6qRR1kAfc55bbNNRBFw4I3pa00HBSqIYtzy9oOvUXBf57rSx6hu6XrnFHltTPD
	1aTbKfb4eGRdzUK40UnDnzeFfSm8cMDSq8BTPisuuUg/Folxl7f75J28Kk4biZVRcjGKvE
	9kQ/PJHjKN72b2AXYDJPNw3gwTbO1QY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: maintainer: Fix capitalization
Date: Mon, 15 Sep 2025 21:22:35 +0200
Message-ID: <20250915192235.2414746-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The sentence starts at the previous line: s/Indicate/indicate/

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 Documentation/maintainer/maintainer-entry-profile.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
index cda5d691e967..f411a0d10fad 100644
--- a/Documentation/maintainer/maintainer-entry-profile.rst
+++ b/Documentation/maintainer/maintainer-entry-profile.rst
@@ -68,7 +68,7 @@ wait for the next -rc. At a minimum:
   submissions should appear before -rc5.
 
 - Last -rc to merge features: Deadline for merge decisions
-  Indicate to contributors the point at which an as yet un-applied patch
+  indicate to contributors the point at which an as yet un-applied patch
   set will need to wait for the NEXT+1 merge window. Of course there is no
   obligation to ever accept any given patchset, but if the review has not
   concluded by this point the expectation is the contributor should wait and
-- 
2.51.0

