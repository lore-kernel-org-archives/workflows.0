Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147841AAE13;
	Tue, 13 Jan 2026 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768329796; cv=none; b=i8MdVrHhn9/xDo0a47+oOIpulNhkgrorH3E5DcrtWW2M2AtfPbNKACR1SwNC0dAqCCptTFFfV6WI+UCRf6vZye4+i1YXywsu5QC3WdWrvC5/V6UPESok+Ix1bHCWswa8iXj0BSr5b1ghloJaRpi9w2unq3QD+uGrWtQ+G2twnVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768329796; c=relaxed/simple;
	bh=XNOyE9mCvL5mbNr6jvzKxIpMs0gdYJzUjefFAkpQyTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tP//qDYzCz4TrgOsBCBnscaJ4f9EfczUMBznqplSMJTvA/Q9XOkGx+cmMmIWSfNUUMssgS3S4y4sneg3LxPcGCHahs4mQ6fPSbGit364h+mS7hyUuyP6H90wZPkAqDZZko25UCfW5Ai6pbaF1GADjnhd7i5bgLQrhi8ImBL/VEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rB37nKNg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rB37nKNg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72308C116C6;
	Tue, 13 Jan 2026 18:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768329795;
	bh=XNOyE9mCvL5mbNr6jvzKxIpMs0gdYJzUjefFAkpQyTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rB37nKNgXJQUNhwUyNfyzx/0wrSJP3kHYU94TlzbKE9tGw7woNoD3cxPqtvQVwamd
	 wgYy5WhnMnijO/VRNhaIE5D/y5cxgTrO6WcN4Tdyab/iigKVfCg3RZ0olAriSVlChY
	 +lisDShHqg9y/D3G5GBNG8t+FTo5NdYV32Z/jbTG7A97pnzgZXkDlE4BXWqYJaq4W/
	 WzbyL8E5iNcE3LDACh03FhjXoBvtSN7paRW1O2A6Liagcm77Lslzr8b0jXs98bauT5
	 oKuapTuKdUFrtAI4XxfY+1U1ZYQrDsc/Rp2x4WBx8Vzn7Ro01jVjp8a9yWOpSaB1LD
	 6xBNun+nPgFMg==
Date: Tue, 13 Jan 2026 13:43:14 -0500
From: Sasha Levin <sashal@kernel.org>
To: dan.j.williams@intel.com
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Simon Glass <simon.glass@canonical.com>,
	NeilBrown <neilb@ownmail.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aWaSQsl8h2wnBjzj@laps>
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
 <aWXYi35pu9IHf2eE@stanley.mountain>
 <69668cfc63bb1_875d1004@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <69668cfc63bb1_875d1004@dwillia2-mobl4.notmuch>

On Tue, Jan 13, 2026 at 10:20:44AM -0800, dan.j.williams@intel.com wrote:
>Dan Carpenter wrote:
>[..]
>> If tools permit you to generate a contribution automatically, expect
>> additional scrutiny in proportion to how much of it was generated.
>>
>> Every kernel patch needs careful review from multiple people.  Please,
>> don't start the public review process until after you have carefully
>> reviewed the patches yourself.  If you don't have the necessary
>> expertise to review kernel code, consider asking for help first before
>> sending them to the main list.
>
>Note, I do not want additional changes to this document, my Reviewed-by
>still stands with this version, it is good, ship it.
>
>However, I do want to endorse this sentiment as uniquely capturing a
>truism of kernel development that perhaps belongs in
>Documentation/process/submitting-patches.rst. It captures it in a way
>that avoids the conceit of the "slop is special" argument.
>
>Contributions are accepted in large part based in trust in the author.
>So much so that even long time contributors self censor, self mistrust,
>based on the adage "debugging is harder than developing, if you develop
>at the limits of your cleverness you will not be able to debug the
>result." Tools potentially allow you to develop beyond the limits of
>your own cleverness which implicates the result as "undebuggable" and
>unmaintainable.
>
>So a simple rule of "generally you should be able to demonstrate the
>ability to substantively review a contribution of similar complexity
>before expecting the kernel community to engage in earnest" mitigates
>the asymmetric threat of AI contributions *and* contributors that have
>not built-up enough trust capital with their upstream maintainer.

Looking at recent history (v6.12..v6.18) we had 1902 authors (a third of
overall contributors) who contributed a single commit. Out of those 1902, only
177 have a Reviewed-by tag pointing to them.

With a rule like the above, 1700+ contributors would have not been able to send
their patch in.

-- 
Thanks,
Sasha
