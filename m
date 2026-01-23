Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691092DC339;
	Fri, 23 Jan 2026 15:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769182225; cv=none; b=gJQEeJZ+el/c0whMn8Jkt2LMKBtrLj1/z03zcYzkwO4OtHNb17iBbCdzfIpquo1tYuu0B9l1LrkLPPIceaMtRTOxkFdqcLOwpFXC6fC36fLidk1UbQd3oW3A0MFpmhQTFU0rfWckdT7mreWZTXVJItXUi98z6YcRMjDhzflkxOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769182225; c=relaxed/simple;
	bh=PX3+P9NHk0IfgQwPFC3RikYDjuSYUdRfphtiW1u6Qiw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cAjRmYx3PMANb67k9YN2qKFQRg0jkteY3/CRjHtnwdOeVXj1NaOyP5VPoxai7zFqkdjUqlaNF/O0PB5/crEvqtA5cUnYllwRgJYVg6X6WOJVEOCjclKE4J9/ja4kQP6KN8xehXL5xwlmd512iJ1kygcU/K3hD1kb7MjFDky75Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 8E3EB58A8B;
	Fri, 23 Jan 2026 15:30:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 980C632;
	Fri, 23 Jan 2026 15:30:13 +0000 (UTC)
Date: Fri, 23 Jan 2026 10:30:40 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Kees Cook
 <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel
 Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae
 Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Simon Glass <simon.glass@canonical.com>,
 Lee Jones <lee@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 NeilBrown <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>, Sasha Levin
 <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka
 <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v6] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260123103040.7752d6c1@gandalf.local.home>
In-Reply-To: <20260119200418.89541-1-dave.hansen@linux.intel.com>
References: <20260119200418.89541-1-dave.hansen@linux.intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ynx3dp1d9zmm9gf7ttrjopqwtzscoyap
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 980C632
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/KdcdpU+QlIlkrpbCjac/OSaLtzcBWSAs=
X-HE-Tag: 1769182213-938313
X-HE-Meta: U2FsdGVkX1+VJ5sLu6eB44ziFPwm6k7hhsBJMjcgXkfbw6yMd/rH5Qfjh7WtRaUBcu3jVFvdwi29R/dzc9i2ysMBJLXXkYOdRdAcKaVCx+W+AyfwODmzRXlUtkRd9BEM+zsVCz4m4ULvRrWx5LYVRxGH178vuO/pKUi+CL9IcyDs0B2Ia3LrsgSj74GzQt9W5yt+yVC2dwpRZdwRh5PlpIAIVfiu64l/TfSLHGk1N8p2PEksKUZJOfVxraEdpP7ydhGpdATRbz0RNL3UyVtSjfgz5x5p8Rq9wduWsUvihqldPTLZgxHod8Te9Z/6AZlsJE+v9pqWzZ3BEJdZ/JhkSoho5kIUlIeR

On Mon, 19 Jan 2026 12:04:18 -0800
Dave Hansen <dave.hansen@linux.intel.com> wrote:

I decided to go over it one last time.
> +
> +Out of Scope
> +============
> +
> +These guidelines do not apply to tools that make trivial tweaks to
> +preexisting content. Nor do they pertain to tooling that helps with
> +menial tasks. Some examples:
> +
> + - Spelling and grammar fix ups, like rephrasing to imperative voice
> + - Typing aids like identifier completion, common boilerplate or
> +   trivial pattern completion
> + - Purely mechanical transformations like variable renaming
> + - Reformatting, like running Lindent, ``clang-format`` or
> +   ``rust-fmt``
> +
> +Even whenever your tool use is out of scope, you should still always

Somehow the above reads really weird to me. "Even whenever your tool use is
out of scope". Do you mean "Even when your tool use is out of scope" ?


> +consider if it would help reviewing your contribution if the reviewer
> +knows about the tool that you used.
> +

Other than that, LGTM!

Thanks,

-- Steve
