Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A58F168AB
	for <workflows@vger.kernel.org>; Thu, 29 Feb 2024 00:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709166833; cv=none; b=g4NTxBLBqaEVDYhdZqTFEa0Rm5cTqLn8sEwqP1YYit7pwuwIsIJ99pEL17xK9KlskTgMXDXoKeKb04C8y8xEw2ry61DOU9xh2IU2CeW2PFKdYwCsLVpwBKya6q8q8rN/W8lheN+3DM0/AnzplULuWME8IoECt/prasCC+gZ/onI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709166833; c=relaxed/simple;
	bh=fo00jB401P35ZMxe0xPOnl0LGbQYCSGuj2RIivhw74g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fstBEbMas5eJNCC4QlERftufFlGu+XJulF3pTnF0i502F19XNtol4CsI0pzBE5Rle+xB5da+CE9RayO1rJrSI5IZfYfNOpXJVXEGcnFvpQ2douB5rwdnFWY8UYHG0t3j3QeXPVQBlgmDFu7PwVMF7uimtEEpiFqL+VucHp+zQAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=mLQ2oDAs; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=mLQ2oDAs; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="mLQ2oDAs";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="mLQ2oDAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1709166830;
	bh=fo00jB401P35ZMxe0xPOnl0LGbQYCSGuj2RIivhw74g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=mLQ2oDAsvGjVK0mcvD7bb34UKrSy8qEvwoC7Yga539prexFcRl0ma/a+3Tx3TdPPm
	 mvd2StuoM0h+obi7X6roEyQ+Z50YYCWVp2MPk/AeL+1NUnRkAnDl8Oi21Fvl2clCxD
	 CwhWj2VTW4JkY9xlCdj0evS422YMn7QRFYiRceLM=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 90DF612861A8;
	Wed, 28 Feb 2024 19:33:50 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id rAeAeLH7ozK5; Wed, 28 Feb 2024 19:33:50 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1709166830;
	bh=fo00jB401P35ZMxe0xPOnl0LGbQYCSGuj2RIivhw74g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=mLQ2oDAsvGjVK0mcvD7bb34UKrSy8qEvwoC7Yga539prexFcRl0ma/a+3Tx3TdPPm
	 mvd2StuoM0h+obi7X6roEyQ+Z50YYCWVp2MPk/AeL+1NUnRkAnDl8Oi21Fvl2clCxD
	 CwhWj2VTW4JkY9xlCdj0evS422YMn7QRFYiRceLM=
Received: from [10.0.15.72] (unknown [49.231.15.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 349131285E9D;
	Wed, 28 Feb 2024 19:33:47 -0500 (EST)
Message-ID: <0dfa0b21553b022f73c0c3b22cfc95110f953a0e.camel@HansenPartnership.com>
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org
Date: Thu, 29 Feb 2024 07:33:44 +0700
In-Reply-To: <CAHk-=wixuZ3SwabT69MEt6=c7hTJ=s4ptVDSD6UKtP+iBANy1A@mail.gmail.com>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
	 <CAHk-=wixuZ3SwabT69MEt6=c7hTJ=s4ptVDSD6UKtP+iBANy1A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2024-02-27 at 16:43 -0800, Linus Torvalds wrote:
> I personally would find it more intriguing still if it actually
> reacted to the code instead of just the discussion, but I suspect
> that's still some way away.

So this bit may be closer than you think.  The Software Heritage Org
announced a LLM trained on all FOSS code in the archive:

https://www.softwareheritage.org/2023/10/19/swh-statement-on-llm-for-code/

So it should be possible for Konstantin to plug into it.  The question,
as with all static checkers, would be whether it produces a decent
enough signal to noise ratio for us to find it useful.  I bet in the
early days it won't so someone will have to help curate it and improve
the model as a full time job, but I'm sure the SW Heritage folks would
love to help.

James

