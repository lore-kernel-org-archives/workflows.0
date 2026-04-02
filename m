Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C291459FA;
	Thu,  2 Apr 2026 18:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154455; cv=none; b=Y/e7QMqvWK6+vwBo1UJeNC75584SFMz+W/NfXOh351ntIjPtvau0YYoko//LlUL5WUXYgE2Yr/QNmNKgux26BqFsv89V4UO6a/aUiLfRGLUGUuRdkVPvOJF9aOU8DCNVtlQCkSPWKjUDv1pkj+1ujLjdkAee+swTIZY3Out/w/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154455; c=relaxed/simple;
	bh=N0vNAAI5gXAMOrBVixYY0gOqiUZY0NlzqeziFlV4Nqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZttA5rt+qu81LneE7UsYorf3vMBJyk0dKkMpuLhLG1+NP4NJoFv8rhS5b6xp7i9M66ZPh4hicPN0fsMH4sdPy62TaqSbp7eYxWhwp0kXOQToytVE8fAUJzggG8ezrK2FGhlHH29W3F9Lzdx2g6/vqeBDgyAx9FsotX0ozT+muK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=NiJVcrAK; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="NiJVcrAK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775154452; bh=TVdv6NTixhQByf2qanXe/y+7JNZ5emjGvzV9lZi9lhg=;
	h=From:Message-ID:From;
	b=NiJVcrAK5Kn/CfWs9a2O3XBaTdhd+6OeZp+xwfIe3vP080o5Fim83pGJQmsP6BfbE
	 JuUKaSTbqdclrqudUbb0uaoxN9yOcpJb8iutltlQ3X//CMinpwBSMMMHFSKEGmskSw
	 QFnoi5yXws1dxVri4bQcbQTX8OVsVKLN/LoL/REQ=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id E2EC5C09DC;
	Thu, 02 Apr 2026 20:27:32 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: edumazet@google.com, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>
Subject: [PATCH 0/3] Documentation: clarify required info in security reports
Date: Thu,  2 Apr 2026 20:26:52 +0200
Message-ID: <20260402182655.8636-1-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

I'm sending you the doc clarifications we discussed for the process of
reporting security issues. It's cut into the 3 patches I shared this
morning on the security list (plus two typos fixed and a paragraph
asking for one single issue per report):

  - one patch that reminds our need for a valid e-mail address
  - one that explains to reporters how to proceed to find maintainers
    addresses, hoping we won't have to do it for 90% of reports anymore
  - one that enumerates basic requirements for every report

I think it covers the difficulties we've faced this week. As always,
we might possibly find tiny adjustments to add, but my goal would be
for such updates to be merged in time to update the public page ASAP
so that we can redirect incomplete reports in an attempt to lower the
team's current load.

Thanks!
Willy

---

Willy Tarreau (3):
  Documentation: minor updates to the security contacts
  Documentation: explain how to find maintainers addresses for security
    reports
  Documentation: clarify the mandatory and desirable info for security
    reports

 Documentation/process/security-bugs.rst | 147 +++++++++++++++++++++---
 1 file changed, 132 insertions(+), 15 deletions(-)

-- 
2.52.0

