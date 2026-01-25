Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED32F068C;
	Sun, 25 Jan 2026 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769366432; cv=none; b=nR+67fF+skAYiZBD0bQ1BfhJlCEol8edp4H0pzMeeB++mCn84m83aLarN1mGYkpeJrjr1sV4OHiYOQTNM1eGNEbdIYV26/naqjpbdlHsd+/DhiqxGWR7KBV4JkvJ/0saOG4N6T/2KRNskdnwce+gRO+QYKFpVbWDDH53H1ZDWQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769366432; c=relaxed/simple;
	bh=k0zIsDDirduC1T/Zy9Rie5eliNLSn89gCShZi0Glsp0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IUxnrs9tue6qRYB/DVSUPhjm5xXRUX4Dy/6Vmh7w68o/VDXIQoc97qzhL0qx+LdNSr0VPJmYSQZzpDWw9s+JriRKTmpqMarY+kTbmy9/GqMawUOyWCdCOZ/qGNsntfgqlRQ/HzIucYZtnkHr4nI/VcdOM6bak7LATFEYF7693B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fsASiqm+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fsASiqm+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C989A40B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1769366430; bh=EkqR8AfHdMFHnzuWmmZ2wY0NlPxqrI33UUDv9469iII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fsASiqm+NqSRf6Nj0DG0yxe/1BXZrj0b1/WvlRubLD0LTWK2A27y6pczt2E0SlOYC
	 4azJlPsS5GQMy7Bnk6amP/db3ciS1uVR5RT26IPP12cL+evmCOTkNUX/+OMHZ9VRdc
	 3vxpdkM+KPlU9ST/A+0QAbsbHEenDkiZhoMh3sZAUU3nEHkLhmMHxWcGZ5fbVmiApR
	 om08NjSscVBwPn1yCYGskho48cqeuzI76micC03f9MLAEeUe+9crju5yxmzzGJZnBP
	 nPcWx9v74CvHJORKBLSipXFB6D76dKEaaKi0i/OmT5A+HgdPuI6+ayC3Y0cCQcbY0A
	 3jsmybl13UnNQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C989A40B0C;
	Sun, 25 Jan 2026 18:40:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: John Ashrith <johnashrith6@gmail.com>, workflows@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4] docs: clarify CC list guidance wording
In-Reply-To: <0bb5ad12-dd5a-4280-bf6e-7d1ddb59dd9e@gmail.com>
References: <0bb5ad12-dd5a-4280-bf6e-7d1ddb59dd9e@gmail.com>
Date: Sun, 25 Jan 2026 11:40:29 -0700
Message-ID: <87ecndedsy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

John Ashrith <johnashrith6@gmail.com> writes:

> Changes since v3:
> - Add proper changelog text
> - Move version notes below the --- line
> - Send as plain text to avoid mail client mangling
>
>  From 1de01779d580e104bea0148409c3c8c76d204c41 Mon Sep 17 00:00:00 2001
> From: John Ashrith <johnashrith6@gmail.com>
> Date: Sun, 25 Jan 2026 14:48:28 +0000
> Subject: [PATCH] docs: clarify CC list guidance wording

Again ... the above text should not be in the changelog.  I can
certainly edit it out on applying the patch, but you really need to find
a way to send patches that don't make maintainers do extra work.

I'll say again: please practice sending to yourself until this comes out
right, then resend your patch to the lists.

Thanks,

jon
