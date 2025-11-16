Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26A9309DDC
	for <workflows@vger.kernel.org>; Sun, 16 Nov 2025 16:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763309866; cv=none; b=aqUxD4xD7JghL5SeCuM37z3lmzjMlJIxrb6Pa3zMFyP1xKk94lvRdxUqBydBDmPsKElHam+XRnfCJt6nCkqs8H9owG3t9+nAZpysDjvEoApwh/V1AuSJc57jxutdvKyn3OW4ERz35DRtPCTHrEWVTxPBfbvjlAFoCDXcD/MrWg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763309866; c=relaxed/simple;
	bh=Gbc3qNT8Jna739+WH477QX/Q8NIC3Q/8E7mg4EepvzM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWGd89Sh8PvAZ1iFY/jj0E2YGRwfD2x8NK2L/y1QUj+ouyWuyRCBZerZhJ49tHD1BMJAL2ohRFbl+JZIGcmob0CA1GZ83poO8GoAhm6EWiPticPcRD/Mqfk7PdaF58Ebr2b8lr1c/+OlZpATQK+qoQDt50BYgj7FJPDoTdRbYYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 192D712F090;
	Sun, 16 Nov 2025 16:17:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 9978530;
	Sun, 16 Nov 2025 16:17:33 +0000 (UTC)
Date: Sun, 16 Nov 2025 11:17:32 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Kees Cook <kees@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 dave@sr71.net, Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, NeilBrown
 <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan
 Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>, Sasha
 Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil
 Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20251116111732.5159839e@batman.local.home>
In-Reply-To: <EEF974E1-08D5-4E67-8AC4-4315CF9D10C1@kernel.org>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
	<20251115140746.6a3acfd5@batman.local.home>
	<877bvqan70.ffs@tglx>
	<2804290.mvXUDI8C0e@rafael.j.wysocki>
	<EEF974E1-08D5-4E67-8AC4-4315CF9D10C1@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: oxc7kofbxq89fh47qtjm4z9t4ar9789g
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 9978530
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19JmA58+PAl2z+VpUi9YLsN9qx+Hyh1nRE=
X-HE-Tag: 1763309853-312279
X-HE-Meta: U2FsdGVkX1/EHFy1FL14Z8h0xGaSnQtZKjHTb0nTSEq5AL5qrFeO2kuvYOp0xnWqQfn2oQ7eDL3AdFV1V5VAeNvHynodnbyqPPZEWzU7vLSV/GWtiWkA2gAdrhhogVyYYzycbEK1In9YeDGnf0zWn2C4zNSdYoowlXBPiA6ML/g7OlZMiGgSRfH6Mmo3ZwjvxFxYviwU3EUU167va8Vk8cJYqf1rrJXCBzlM5paCWVs1cC2EkqkOlifsHvuQZyHVsDd7ccgtQxH0Ue2eWiDLrPWLbmNho1cdRFIsDYvvuHP4ulwPoeJNdIvOVXAHXc0TcmAmA3SiREQ0y0TEnNoNJirjsFYmFWnT

On Sun, 16 Nov 2025 07:25:46 -0800
Kees Cook <kees@kernel.org> wrote:

> A tag isn't going to capture what we need today. Because the LLM
> usage is so variable, it'll be, at best, misleading or, at worst,
> totally inaccurate. I've provided several examples of this where the
> range of LLM involvement is very low to very high. The prior
> discussions have shown that we haven't yet found a sensible way for a
> tag to capture that.
> 
> But the common thing everyone appears to agree on is the "show your
> work" concept that this patch is trying to capture. I think it's
> likely we'll grow a tag eventually, but it isn't something we
> understand the context for yet. As a first step, this document is
> designed to show the foundational goals for what we want documented.
> 
> Over some time of applying this, we'll start to see common patterns
> and repeated descriptions in commit logs. At that point, I think a
> tag will be warranted. But right now, we don't generally agree about
> what aspects we want a tag to cover.

Exactly. My fear was that by adding any new rules (like a tag) will
steer this conversation into a never ending bikeshed arguments, which
was exactly what we wanted to avoid.

Let's have the "tag" conversation at Maintainers Summit and just keep
this document as something to describe what we do today.

-- Steve
