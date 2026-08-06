Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA51447807;
	Thu,  6 Aug 2026 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031045; cv=none; b=KBTZFk/+ssuLi3ogPEqOey5Xg2RJLHhDHZyWcPrNPxH2qVnkk5kOAE+0ltWT+66BnbM1um1+BPwFzn4lSK6uz4BXX8bzhOGRgHO8jHEKZfNnaH278Z/Xi2dgjxBmiP3EJwjnr0TOSAhBuOWQ5AH8Dh5X/1O6iJes09EzFKHL38k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031045; c=relaxed/simple;
	bh=jXOZtDhN0c0IoL/IfrBiZW9DrX/eu3kb9RKFPYha7os=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=kC2GecnisY4tc5VKPcNjEFD+JIdzTAlYiA+vF9SEb4tYB9YCjeIZmHtF/zetawmIagnneEkieXSjDUBWjYEY4XV81XN5CckvfLPBuEq3ur/VmYDABWlrdSMRR/X7PBiYiNefPoePNlpe439nXxVfPbJyNNdErsgo76joXT4r2Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=N6dDqIyF; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="N6dDqIyF"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hGBQm4lpqzMlDK;
	Thu, 06 Aug 2026 17:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786031040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jXOZtDhN0c0IoL/IfrBiZW9DrX/eu3kb9RKFPYha7os=;
	b=N6dDqIyFxcAYElu3SqLupGkD9WGRrkIYZtvUg7fkGu7PRzzjAlOSWXGbfRUIdIIS1FKYar
	ECiqEVjm/4CMnxiKtNeEfUZVio39MEXhOKHFJjhh5JBxWCIsiOPM1eOZdX162HC8/pzopb
	e7VLYDmJNc1NcC6ick83Tz1TgVRSVScYBmI0G/HuoMBJXnnlL533X4pJFTKFqi7deJNPPv
	qimnxUMvM7qT8f5ty1b5lDaLkNsBoHHEmYlYNelHu4qJp+5PJ06q6Z9HRHlZKPJ5qRNUr/
	zS99d/b7u8F/fEV0B1QPtowW6Vfw3JCwHnTtc6srTv0sN0nCLk+gV+A5VEzn8w==
Message-ID: <9b925bf4a6e4359f08e5c6e1a98ba52dcbd8d9f4.camel@mailbox.org>
Subject: changes.rst: use and users of optional tags
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  "open list:DOCUMENTATION PROCESS"	
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"	
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Thu, 06 Aug 2026 17:43:57 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: heq7xhf4apaq1jtkwajwnni6454ck6ts
X-MBO-RS-ID: b78c91eefc951cfff37

Hi

in the table in changes.rst some tools are marked as optional, sphinx has a
foot-note and the paragraphs below have optional markings as well (they do
not fully match the ones in the table).

What is the optional tag for? as in what is basic use vs. what is extended
use of the kernel (requiring the optional software)?

Who uses the optional tag? I can imagine there used to be people with scarc=
ely
memory, bandwidth or computing power. But I don't think this is still the c=
ase
nowadays. Who else would use the tags?

Thanks
 Manuel
