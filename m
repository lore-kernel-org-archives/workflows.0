Received: from mailer241.gate86.rs.smtp.com (mailer241.gate86.rs.smtp.com [74.91.86.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D55A41F37C
	for <workflows@vger.kernel.org>; Thu, 16 Jul 2026 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.91.86.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207070; cv=none; b=ZmPntxFVufXLBseEsk8Os4fmLjVx5E4Mz4WdrEu37AG/pwZQNWN84HFdnfpqPtlKT8bdprAiuiQjJGa83W/NN394xSsEM0rEhbvT4LCgK0lWwZlPNJHhAdwYGDgcd/RdGoK3M5wDjEdhMx9vyJZ+GAmVqet4QhskDtzXZpSIfkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207070; c=relaxed/simple;
	bh=Rn89dfL6FWPUehEVjmWIx5moDiRsrqTA+wfW2mcNVN0=;
	h=From:Subject:To:Content-Type:Date:Message-Id; b=OdJR7covzjoBoyAjfqftwV5SwatfaNfnS0yiqmLoknmDT51ArbksQIoKQ66P4K0k+AMZIyRs8SsbUOS1/i4+YLb9E7VkA7eJVbfytgN+ZYbMlxG7MXdA6g+KUQm+pa+g7AwMrDIxkjqBrtCjKSCr/vdGrXg2g/zP5QvAVGbKD3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com; spf=pass smtp.mailfrom=computergamingpc.com; dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b=fVkci1n7; dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b=jF6zqHDX; arc=none smtp.client-ip=74.91.86.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b="fVkci1n7";
	dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b="jF6zqHDX"
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.30] (unknown [10.138.12.210])
	by mtl-mta02-out1 (Halon) with ESMTP
	id b479d81c-4a02-413f-bfbd-ef9612d78a2c;
	Thu, 16 Jul 2026 13:04:27 +0000 (UTC)
Received: Received from 10.138.12.169 by Caffeine
 (s0-aws-app2-swarm-manager-5) with SMTP id
 67c6ca4f-dbe6-4d0e-920e-3887a77c5838  for workflows@vger.kernel.org;
  Thu, 16 Jul 2026 13:04:06 +0000 (UTC)
Feedback-ID: 9194450:SMTPCOM
Received: from ObaTech (unknown [191.177.193.228])
	by s0-aws-app2-mta-in-2 (Halon) with ESMTPSA
	id 67c6ca4f-dbe6-4d0e-920e-3887a77c5838;
	Thu, 16 Jul 2026 13:04:05 +0000 (UTC)
From: "Computer Gaming pc" <sales@computergamingpc.com>
Subject: Current Inventory Update: GPUs & Enterprise SSDs Available
To: <workflows@vger.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Reply-To: <sales@computergamingpc.com>
Date: Thu, 16 Jul 2026 14:04:06 +0100
Priority: urgent
X-Priority: 1
Importance: high
Message-Id: <16052026070414917047A089$7C3C9C43C1@computergamingpc.com>
X-SMTPCOM-Sender-ID: 9194450
X-SMTPCOM-Tracking-Number: 67c6ca4f-dbe6-4d0e-920e-3887a77c5838
X-SMTPCOM-Message-ID: 1e771023-33c2-40cc-834b-e0cf0f36f1d6
X-SMTPCOM-Payload: 
 URD1vV4NPHYH9q0oT5NR-R07wKHvfshnzpnONfnejqMwLMlwyowN2tct-L1CZaUri3Hcj49eUE1PdynvQtxrW9NVeCRi5jIFrZOmlMXk-dkcGLWCOpxrLGFVuVmWOPXBGua5vq2LLHHqPMmJgZZdEqzjCsGejmIz780kPTraxxLrlbIV2C1X1vicW104rvmD
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=computergamingpc.com; i=@computergamingpc.com; q=dns/txt; s=smtpkey;
 t=1784207052; h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=Rn89dfL6FWPUehEVjmWIx5moDiRsrqTA+wfW2mcNVN0=;
 b=fVkci1n7gx32IUzG4M007om9iBiQAjGmhabdSe9q7Qhr6b5a7Wts9UzW9yWB7TWIxbcHH
 qnl9xcEozteb3KNac6bR5ShHomO3hB7O0ZDnrQLzV+eymP61C1AxPhhPnIxbSgu11pwxWh2
 82QFfJdQiauIr5lyuKHN+cyk/e9gwsafuEGigaySr3z8sT2s2GoGf9Z8yxpyu5riIjytmmD
 aO68oa8zcpgVcGzUp8MWgXajpq3Awaq/xvCAdhuoGowZQt+9BfMZxL5Ip+liYs8EHy7+fm3
 Y10SgzAhSM7TblcDe9PILZqxKC3n7h1/h6TSE/e0ZRXkreP99Pwsdpn2Zzkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpmessage.com;
 i=@smtpmessage.com; q=dns/txt; s=smtpcustomer; t=1784207052;
 h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=Rn89dfL6FWPUehEVjmWIx5moDiRsrqTA+wfW2mcNVN0=;
 b=jF6zqHDXncUrEYYaBEi8cuKh/m98m2Bz47e5VyFAEev3ozL+e/5eDSZw3saImvuv9Qjyf
 N1+2DC+ekmrWTlWPrbzuzDWuOpwrhK5vZ0K+AkKu0baaZagQmakqeb5Y2rZMCZZCKqV7ddE
 yWKOo52vTHvkO/2jZwqoZ2Ceqt8fk/rzezzU4tCE0Q9NjLCg/9pssXkO18NtaRt3qRrZbIB
 Y2DtWSySYkgstKve6lauoG3kXJQI+DD6PuS4qS9YYdqt0Z/LswqdUM7wS2CFrvlS2hQv5k1
 Q55wZpZxjrkCFfUZQvOlgqqRZ2bexAIj0EBriaG3n70WP8AiyAzCI5s3a/AA==
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>

Hi
Quick update — these units are in stock and can ship today:

Memory Modules
* 128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM (Qty: 980) – $140.00
* 32GB Dual Rank x4 DDR4-2933 CAS-21 (Qty: 1,500) – $140.00
* 64GB Dual Rank x4 DDR4-2933 CAS-21 (Qty: 1,200) – $450.00
* 32GB Dual Rank x4 DDR4-3200 CAS-22 (Qty: 1,500) – $150.00
* 64GB Dual Rank x4 DDR4-3200 CAS-22 (Qty: 1,100) – $450.00
* 32GB 2Rx4 PC4-2400T (Qty: 1,500) – $45.00
* 32GB 2Rx4 PC4-3200AA (Qty: 1,500) – $45.00
* 16GB 2Rx8 PC4-3200AA (Qty: 1,500) – $20.00

Solid State Drives
- SSD SATA 6G 3.84TB SFF (Qty: 450) – $120.00
- SSD SAS 12G 960GB SFF (Qty: 470) – $300.00
- SSD SAS 12G 1.92TB SFF (Qty: 560) – $350.00
- SSD SAS 12G 3.84TB SFF (Qty: 560) – $150.00
- SSD SATA 6G 1.92TB SFF (Qty: 450) – $100.00
- Samsung 990 PRO 1TB NVME SSD QTY:410 - $150

- HP (HPE) P43331-B21 64GB DDR5-4800 RDIMM QTY: 390 - $750
- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 P43331-B21 (Qty: 500) – $750.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 P64707-B21 (Qty: 500) – $750.00
- DDR4 64GB 3200Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $450.00
- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 Samsung (Qty: 500) – $450.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $550.00
- Intel Xeon Silver 4214R - QTY: 420 $350.00
- Intel Xeon Gold 5220R - QTY: 410 - $450.00
- Intel Xeon Platinum 8380: $450.00 QTY: 410
- AMD EPYC 7542 - QTY: 490-- $380.00

For quotes, availability, or inspection scheduling, please reach out 
directly:
sales@computergamingpc.com Call or WhatsApp: +1(774) 559-1248 | +1 (641)232-
4364
Thank you for your continued partnership.
Ann Kamila
Computer Gaming PC Trading
2500 US-6, Iowa City, IA 52240, USA.
To opt out of future updates, reply with “REMOVE” in the subject line.
