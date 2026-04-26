Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B67F38F620;
	Sun, 26 Apr 2026 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777232032; cv=none; b=LrWXN1nuU0Cd5x8oM4BPz0sI17qOtXO/aMIIG4rbrhpmUlO4gMw48fcaQ08RJrbVBGtF1chc5C90buSeRBTQ5tC1q4cRvxhS/zEMwsn3aF+IgLDP76kOoFhO7iGTrJc47tu7QUrb15BSwh7RXf+NfURSVH79O2fKFhUa8rHe9GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777232032; c=relaxed/simple;
	bh=rowAobkvjvgRAl9b2Z+s1osOF3rOUoboO3vWjoI8Lls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnx0XLAzROr+Wxl4peUYKras0pDI5JL8xWhmzq4X4r3k9R+wjbEJH5fKNK0Pg49vYN2NdQB+6+jFpe0k12UEATKlDMLlt6z+Js1Q/jMPT8dP95Y/LpZzynpkijP6kgAN9GehfskROe/Q1QJCy3zr+UwS+pid3ib5lapfUoXPW8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SHn9/CcB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SHn9/CcB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=erN5Eko4E2V4Yz0/dGauB34cs6LKxfw0CRMRc+yw92o=; b=SHn9/CcBBQDF9LsodmANeb+kg1
	eh3hEkrt9rbWx5x03q0GvpqqxbnLVdeIaa2j2GwpGaXwL1IJWyzpiXh9vrNcS8IPiPI0AobuRsn/n
	Rz0+tb/IIIMqXkqJYSHD30dMH04Zvor3NJyyJ74i2USBAJF9nV6AlKZJJy6+tt+b4mSdkfm1xN+O8
	uK7uhr1Bz3hdUTFgVOGv12snWsBYyIut5t4+LbaUdMUlWtRyerXmBOi+7GUmXwrO5n9BtlsafS31Z
	CDyH8Cfsl/STZ7Ct10ITszqQdFZqFOc5h3clDRf4OjDtPnkdF1zxj/o6YfjVXWJT9cesj3zywX2rn
	4efqT6bg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH5EW-0000000FnFY-2GSN;
	Sun, 26 Apr 2026 19:33:36 +0000
Message-ID: <be1548a6-9859-477f-8728-be6b1dac862b@infradead.org>
Date: Sun, 26 Apr 2026 12:33:34 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Documentation: security-bugs: explain what is and is
 not a security bug
To: Willy Tarreau <w@1wt.eu>, greg@kroah.com
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 skhan@linuxfoundation.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-3-w@1wt.eu>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260426163914.19449-3-w@1wt.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/26/26 9:39 AM, Willy Tarreau wrote:
> The use of automated tools to find bugs in random locations of the kernel
> induces a raise of security reports even if most of them should just be
> reported as regular bugs. This patch is an attempt at drawing a line
> between what qualifies as a security bug and what does not, hoping to
> improve the situation.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Suggested-by: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
> 
> Leon, while we started this list before our discussion, I reused most of
> your proposal which was more comprehensive, and merged our initial work
> into it. I added you in Suggested-by: but I think that Co-developed-by:
> would be more suitable. If so, for this you'll have to also sign-off the
> patch. It's as you prefer, I personally don't care.
> 
> ---
>  Documentation/process/security-bugs.rst | 50 +++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> index a8a8fc724e8c8..7cc3a1970ca00 100644
> --- a/Documentation/process/security-bugs.rst
> +++ b/Documentation/process/security-bugs.rst
> @@ -66,6 +66,56 @@ In addition, the following information are highly desirable:
>      the issue appear. It is useful to share them, as they can be helpful to
>      keep end users protected during the time it takes them to apply the fix.
>  
> +What qualifies as a security bug
> +--------------------------------
> +
> +It is important that most bugs are handled publicly so as to involve the widest
> +possible audience and find the best solution.  By nature, bugs that are handled
> +in closed discussions between a small set of participants are less likely to
> +produce the best possible fix (e.g., risk of missing valid use cases, limited
> +testing abilities).
> +
> +It turns out that the majority of the bugs reported to the security team are
> +just regular bugs that have been improperly qualified as security bugs due to a
> +misunderstanding of the Linux kernel's threat model, and ought to have been
> +sent through the normal channels described in
> +'Documentation/admin-guide/reporting-issues.rst'.

Remove the <'> marks and let automarkup handle the filename.

-- 
~Randy
