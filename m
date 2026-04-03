Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729D2361DC4;
	Fri,  3 Apr 2026 06:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775197237; cv=none; b=t7uNMQFef+7egO4F8ppDsrSDc+iB4hS//lQE2vTEBGi0ena5sZQp7YNkxnoObSXeQbI7qpOmhJYf25EyD34M+BjctgGYAkVd5Kp9aOw0R+P3Sbzm4/PmfW2tXhap0rD3VR5QxI8oZYSD2U3s+Fj2yQ9KsITOE5aLa1hFxI/UknE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775197237; c=relaxed/simple;
	bh=Po6/2cuatKQD32+eRoDaZG+Ja36oGPU9P40KLKywvKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAvCzaT5BtUf6bnES8YgwVnV77TDva14n6k9ImafoLZZkNhhCmOubBm2ErN9VjKlBo9Zb2Qkua7btHO1qgiaObkjjXADrV46mGzTCR+dORIpLjLgai4+GTbyjsJncDRCTqTD3eblLmKqfLf5b5OSz8XoShxU/eFlmDbmszhARSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=BA6oBTgh; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="BA6oBTgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775197228; bh=A4vvSuwzTl/E2mEWdbfE/jA7a9EbkzczTrhGWQXWTeo=;
	h=From:Message-ID:From;
	b=BA6oBTghQYNUNVlARYwM3npnUTh9yHI/7+t3IPLCE5Dge7inQyXit7EkqkBQJXngB
	 PzOy09xrjXjgOQKLf1XZsUOyj591meMThFaTbbCq8dxl/vsuICb1FsLzR7mKlxN8Hp
	 +TZ8gG+u7acmXH6txbFL78oNc7beKUGxv8tknjP8=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 0BDAFC0AB0;
	Fri, 03 Apr 2026 08:20:28 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: edumazet@google.com, rdunlap@infradead.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH v2 0/3] Documentation: clarify required info in security reports
Date: Fri,  3 Apr 2026 08:20:15 +0200
Message-ID: <20260403062018.31080-1-w@1wt.eu>
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

v2:
  - dropped quotes around a doc link and turned two relative doc links
    to absolute ones (thanks Randy).

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

