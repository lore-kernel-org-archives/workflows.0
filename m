Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7243093D8
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 20:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766523309; cv=none; b=iikqsK5pCgo4ICz9gkk1acZH26o5OnDn1sOQtCoxAW81mUwBOgIiRtnD6L3xfIeKu7kxHn3FOXfSlgxAuBehZcZMroorBAgKhl7P34IQuAhsZwHXpNqhwOL1ZarJ6VsnK7nllI2cYNa6rmzcAx4xpamg4eHwaz6LZ9abkrOwAjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766523309; c=relaxed/simple;
	bh=MVx+vsQVVY4RY8xTEASQEH3Ww4pO7XLHWPU/hB2paKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AUa9cBA0B5fa1NIWU+88BAOddCYuOvjRo4+bGQaKc1zCnHbF6Yzcll/c5BaeMs2t1+wfE0JWcEFFGiMDRMlEc7qhQHGZ5GlwNDanhJL8S8V8yH1k/rdgFMbTvNmKKTAabVhOzR8JSLoWJvFElB7uoGVQrYzLDE2SchMvlf5E3WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 0E9701328F;
	Tue, 23 Dec 2025 20:55:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id AED0231;
	Tue, 23 Dec 2025 20:55:01 +0000 (UTC)
Date: Tue, 23 Dec 2025 15:56:52 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook
 <kees@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 dave@sr71.net, Shuah Khan <shuah@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, NeilBrown <neilb@ownmail.net>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Dan Williams <dan.j.williams@intel.com>,
 Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Vlastimil
 Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20251223155652.7c52630e@gandalf.local.home>
In-Reply-To: <87a4z9w2dl.fsf@trenco.lwn.net>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
	<20251115140746.6a3acfd5@batman.local.home>
	<877bvqan70.ffs@tglx>
	<2804290.mvXUDI8C0e@rafael.j.wysocki>
	<EEF974E1-08D5-4E67-8AC4-4315CF9D10C1@kernel.org>
	<20251116111732.5159839e@batman.local.home>
	<2025122358-flyover-tidy-6f4d@gregkh>
	<87a4z9w2dl.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: AED0231
X-Stat-Signature: 6836zc8bdamr387i8ecy5t37g1u16dpe
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+b8W6BuKaAv1OMxFLT5nFSxuU66XJ560Y=
X-HE-Tag: 1766523301-243559
X-HE-Meta: U2FsdGVkX1+3qi6Q9Zp99O3aLAIJdKewlOQDdgjU0YJSM0jjGo1n/E9oDw/MiVYv7DWBHscxRKON++kJzU4MP/mRLGGUirn/yvzGqf2L5adnFkZEiMETYgG9bEq/kOaPh2JhChrRT5QG11rS4foKYrDWFo/w/0qyEnnE+X2mQzeXPxYIg2FOqQ/rIGVcwjEg/m9yBqlb2HfSR4SDZIrgKETDKCYm0D1WBOVGEykIpkRIZPsyzCu0alC4V/z6Aa6uJXSaIBPTw8kd5KPoRBYopXHI3ihZXagwdW/d4kZWNmrpP/aVkL355q55G+vSZX5rshrlxYDM8ycR6HcGos4KOKYCzu6x3IXpyqQeTzGBOd/SyCkynB1iQIDzTLUt6twrt2TBLjrfzuAY9SmaoKAZ/tZhH8IwQW+etiUn1Z7lSOuTM71yw66WN1LAoq6k6AYJ

On Tue, 23 Dec 2025 10:10:14 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> > What's the status of this patch?  I don't see it in linux-next, is it
> > supposed to go through some specific tree?  
> 
> I've been assuming there would be another version after the meeting, so
> haven't applied anything.  (Besides, between travel, 100mph winds, and
> several days without power, I've not gotten much done in general...)
> 

Yeah. I was talking with Dave on the way to the Kill Bill evening event and
I believe he was planning on doing another version sometime when he got back.

Dave correct me if I'm wrong.

-- Steve
