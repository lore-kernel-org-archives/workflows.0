Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1235C352C5E;
	Thu, 15 Jan 2026 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489465; cv=none; b=sibYJme1dnTRctX/rsz65vErGXtZUlsvXnH8ktFiaP9GJXSXkc8bPJbAHYyzzAn9UsagDnZu+TXJjAtKMmN3FPsjGi3g/tE6gDtApcRVf6FVhpVrZsjFWpXYz6Ivx+/Xw7ZU5cbFLewJNiSsg7/TqP+NKMa9BJA21ilmo9HSp78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489465; c=relaxed/simple;
	bh=W+/hsOufitxJT0wRIw4Z0krHmUQrYDhKT22VqlQwNQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaWyt+C4+PUe53vCW7ubCmF1e6OK2Ktvbei8zM2jIYq+7QMHXcnbd+G1YEIKAQWEFVnbKf1vO+ts4aHVU6xNTgrxuSpZErlZ1IQx1y+S9wCLfqc5NJU1FURJpodCIuFbwYz2/wdZPsfcU9qx4SVquVdGDG+Ai7by6vw44Q1dG4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHx2SFf8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHx2SFf8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5230BC116D0;
	Thu, 15 Jan 2026 15:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768489463;
	bh=W+/hsOufitxJT0wRIw4Z0krHmUQrYDhKT22VqlQwNQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHx2SFf8oSvoj2ZSec3bfA3py8uTdV71Qt4zAQ3Cw2mm+LpuaZf3DGBrRSIXywsIp
	 rEDCvv+4liievZP+fv2Zn5kxnnaPlht6E+2nmyu9ps7bVqAEcmOnRs1YBDzpCVdTyr
	 /X/rU/O7VHNLB2o8zWNpcZMv44QbJEsnT26lgkCl1X/OAvr0fhJ7Uv1z0dOxAyaALy
	 CAVpndIYRzqcGdMwepQxJVr+Dlno24yz8L32lKXAHIByXS1ArkZIIlWPoxzFYkSpBm
	 sHS7PDygssC5FV51089NgIfaKvJBcW02iOLKq0vJy+/4QFWMREZJH6j86X1Fcwd+Wu
	 07YZMKVYhHKBQ==
Date: Thu, 15 Jan 2026 15:04:16 +0000
From: Lee Jones <lee@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Simon Glass <simon.glass@canonical.com>,
	NeilBrown <neilb@ownmail.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260115150416.GE2842980@google.com>
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
 <20260113103609.GA1902656@google.com>
 <921e154d-7e54-40ff-ae85-97b6cee7f8b2@intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <921e154d-7e54-40ff-ae85-97b6cee7f8b2@intel.com>

On Tue, 13 Jan 2026, Dave Hansen wrote:

> On 1/13/26 02:36, Lee Jones wrote:
> ...
> >> +Even if your tool use is out of scope, you should still always consider
> >> +if it would help reviewing your contribution if the reviewer knows
> >> +about the tool that you used.
> > 
> > Parsing ... okay, that took a few goes.  How about:
> > 
> >   Even if disclosure of your tool isn't mandated, providing this context
> >   often helps reviewers evaluate your contribution more effectively.
> >   Clear documentation of your workflow ensures a faster review with less
> >   contention.
> I agree that the sentence is hard to parse. But, I want to explicitly
> say "out of scope" to tie this in to the rest of the section. How about
> this?
> 
> 	Even if your tool use is out of scope, consider disclosing how
> 	you used the tool. Clear documentation of your workflow often
> 	helps reviewers do their jobs more efficiently.
> 
> BTW, I do think we're well into diminishing returns territory. I'll roll
> this into a v6 if there's a v6. But, if it's pulled in as-is, I think
> the original can stay without causing too much harm.

Agree.  Thanks for considering.

> ...>> +Some examples:
> >> + - Any tool-suggested fix such as ``checkpatch.pl --fix``
> >> + - Coccinelle scripts
> >> + - A chatbot generated a new function in your patch to sort list entries.
> >> + - A .c file in the patch was originally generated by a coding
> >> +   assistant but cleaned up by hand.
> >> + - The changelog was generated by handing the patch to a generative AI
> >> +   tool and asking it to write the changelog.
> >> + - The changelog was translated from another language.
> > 
> > Nit: Suggest removing the sporadic use of full-stops (periods) across all lists.
> > 
> > Or add them everywhere - so long as it's consistent.
> 
> The rule that I read is that when the bullets are full, complete
> sentences, you should use periods. When they are just nouns or shards of
> sentences, leave off the periods.
> 
> I _think_ that's the consensus for how to punctuate bulleted list items.
> 
> But I don't remember where I read that, if it was in Documentation/
> somewhere or it was some random rule on the Internet I decided to apply.

The non-consistency of it makes me twitch, but perhaps just my issue.

-- 
Lee Jones [李琼斯]
