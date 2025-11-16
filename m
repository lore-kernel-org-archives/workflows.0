Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB45C3C1F
	for <workflows@vger.kernel.org>; Sun, 16 Nov 2025 16:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763308917; cv=none; b=SzvN3BASerCtDibxwbhjQWhHIo0w/xV/ILEB/8OvTYsYbVp06I5ufiPPhEZIFM7MRoeTrz31K1p9U8wJuTSgFe5iWBqAxKbI1dAI/KdosR0WvBR6+wByx4H9tGPVu+lpiif1riy1obdo+OEwu/XyJjJe+A4IVNok7TcEdwLJJ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763308917; c=relaxed/simple;
	bh=/rmpSRjvYC//BWA5OQOZ2nbSkVmB9cwBo8U5TKrX6dw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FAwsxF6iX4LQChPgVIFwU/OBHMKWE36VrEV1J7aSWtOTTkQSeS7QcSuzM2ckTAzSma8/CuIOVeoomwuj0qt/xWqXDLZbQXbwVv72VzZfO7tXvj7co7ypzIPU5P7Hqft3IvsJ/r4yTtfqxEzAeoLFmKSvq9P90m0wYhPAwc7I8Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 1D7D3C09B9;
	Sun, 16 Nov 2025 16:01:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 2B15A30;
	Sun, 16 Nov 2025 16:01:48 +0000 (UTC)
Date: Sun, 16 Nov 2025 11:01:46 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, dave@sr71.net, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, NeilBrown
 <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan
 Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>, Sasha
 Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil
 Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20251116110146.3417edce@batman.local.home>
In-Reply-To: <2804290.mvXUDI8C0e@rafael.j.wysocki>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
	<20251115140746.6a3acfd5@batman.local.home>
	<877bvqan70.ffs@tglx>
	<2804290.mvXUDI8C0e@rafael.j.wysocki>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 2B15A30
X-Stat-Signature: nsdjq1xb5qcbzafgqahignue3aookad6
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19wwt7skg/+Umi/dRwz7sospO8ZPD7hGrU=
X-HE-Tag: 1763308908-233154
X-HE-Meta: U2FsdGVkX1/+lQULEANLMvPR5UUhY88JFrwyDEdUsjdsmBnHHxw7y7ltM2VtyQCEVcdSSyrcXe0jkSsYqwMbUioImEYdV17iSKU3gExme9FUj3qj9EpYCBLD+hFfR59WMgd+CWGM10i76QyISxwWlTTERamI28nhtS/PbEtCbAzLcl/GFgAsMLbXkfqkzOXgzXFQoAqAk2bUhl4cWjwQt5Helh0KTeWi1xx3ul8idGpBkncCwOLUpPcbpq0S6SdRVOnXErRUkA99fZElFPV0SU1o897rHmOKMQf08T9NAth1IJ6shxwknl3/g4v2fetc8TtbzOnO4vTypN+xxrfSlSRbu+ZF2JRVtdX4dafL4bTOtI6QG2tV60oVkrSnCFJ+CYA/tx/zvH3SP6MFIGYyJQ==

On Sun, 16 Nov 2025 13:38:35 +0100
"Rafael J. Wysocki" <rafael@kernel.org> wrote:

> On Sunday, November 16, 2025 12:30:27 AM CET Thomas Gleixner wrote:
> > On Sat, Nov 15 2025 at 14:07, Steven Rostedt wrote:  
> > > On Sat, 15 Nov 2025 14:05:56 -0500
> > > Steven Rostedt <rostedt@goodmis.org> wrote:
> > >  
> > >> As Dave responded to Luis, although that is a good idea, it's out of
> > >> scope for this document (for now).  
> > >
> > > I should have said it's out of scope for this patch, not document. The
> > > point is that what tag to use for this is a separate discussion.  
> > 
> > Which should be held in the context of this patch to make it complete.  
> 
> I agree, it would be good to get it all done in one go.
> 
> 

It's still out of scope of this patch. As the change log states:

    Note, though, there are fundamentally no new or unique rules in this
    new document. It clarifies expectations that the kernel community has
    had for many years.

A tag is a new rule. This document is to express existing behavior.
Adding a tag that currently doesn't match existing behavior should be a
separate patch.

-- Steve
