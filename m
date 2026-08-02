Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38426321F5E;
	Sun,  2 Aug 2026 20:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702966; cv=none; b=b5j3fr193awNfsLgDEK38Y5KSTEvhdWg9v9/B8kZiq045NwVBLdZVEqO5c8GNSG3YqB80JAF+KazWJR9Wa42hLB1o1awfqB7U70FyutCVFDTK4hMDHPg1ctKtNWFbIJBOHNIZTNbABY4s7NJ2SjSIBJS9pnsYnzqeA2b/HzFZ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702966; c=relaxed/simple;
	bh=7o4Tsjc0g4U6rhMTj0UJMETLgSS2vguT/LLIkhIQvzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=evf9dRbiMXa7fpkOFfgyc4dQT9jLDxsNYJEc22odBN82/WNEWeObdPD4h2/G3q6/+nGrTk13oqd5KIylSuayVU6fUrRlws8ab//3ylstie2UDo9W1feV2nIVC1Pn2JjlRWvJpRPIV+9iv2AfRpdXiat3Xbm1sYoVHyjDQeCueeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=dFnLnqJT; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="dFnLnqJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1785702962; bh=YnK6SOH9shTrIhJ3Plg+XbyPCvxUjk9N3i/HOTYQF1g=;
	h=From:Message-ID:From;
	b=dFnLnqJTd26GZuNtQN5vgfHBLFv7zr52x5k/ELEUHGRALq/QOQI2i+CIfjZFGRNq9
	 /7YYxba1uVQSKrKNRe2F+40odbwyWRNJFvf2keT9TTd4aEOfpuWPOyEOA7KjL2nrNr
	 kgtOaNjc0zwavG6hdHFN9vQ4ANsuBs6N819h0mL8=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 26C45C0A7E;
	Sun, 02 Aug 2026 22:36:02 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: greg@kroah.com, security@kernel.org, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH 0/5] docs: improve guidance for AI-assisted bug reports
Date: Sun,  2 Aug 2026 22:35:35 +0200
Message-ID: <20260802203540.3453-1-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While vulnerability reporters have now started CCing maintainers,
showing they read the docs, the security team still spends a lot of
time repeating the same comments about tested version, incomplete
fixes, poor email client setup causing formatting issues making
patches unusable, unverified reports and missing Assisted-By tags,
each time for AI-assisted reports.

This series adds small updates to security-bugs.rst, threat-model.rst
and coding-assistant.rst to better deal with this and provide minimal
instructions helping the LLM follow our expectations.

The updates were iteratively and carefully tested with 3 models,
Opus-5, Qwen3.6-27B-Architect-Polaris2-Fable-B-F451, and Gemini,
until all of them strictly followed the rules.

It is expected to further improve the situation.

Willy Tarreau (5):
  docs: threat-model: clarify "security bug" vs "vulnerability"
  docs: threat-model: move fake devices out of "non production use"
  docs: security-bugs: clarify what counts as a valid version
  docs: coding-assistant: explain important steps when looking for bugs
  docs: security-bugs: clarify some mandatory steps for AI reports

 Documentation/process/coding-assistants.rst | 37 +++++++++++++++++++
 Documentation/process/security-bugs.rst     | 26 ++++++++++++++
 Documentation/process/threat-model.rst      | 39 ++++++++++++---------
 3 files changed, 85 insertions(+), 17 deletions(-)

-- 
2.52.0

