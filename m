Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA3C1DE89A;
	Fri,  9 Jan 2026 18:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983677; cv=none; b=gZihXCAwqGhHS61t+gpA+K9zZXVDqkb82QeBTlF5u+DSxqtlMzPWAlflx5WoUS+/aCZMZqoAGux0pQNem7+pQxXv3OoHaNuLzjlm8EZ8P8WNkXaeCJ6LmSr/uFtlcYVu7lcj9JJ7Dpp1iUgDav4z7jlcrWogk9gmNhGh+fBC/10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983677; c=relaxed/simple;
	bh=cHYbO2Ri25fGsDImWN04eVPPkTiiok8R9YQ3sJCU9nU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YJ9nZjfISuoI59nN74n0kLY/OThivkQVTgF7ifaa5pJRsxJbSCqkaVHL1pV0Xjgsm8Xp934x1OIBUCPXUpdcI3KW4RYvZWg2A5PG4DSKx06/CkgG+TA9nc1mDgpcl8gnMlf+TqbMqO/f9s6FWYC9/yGu7+3YjExy2BkxlS2TjVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TNTcj0BG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TNTcj0BG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39E3C4CEF7;
	Fri,  9 Jan 2026 18:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767983676;
	bh=cHYbO2Ri25fGsDImWN04eVPPkTiiok8R9YQ3sJCU9nU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TNTcj0BGR3lXIPPMuP6EldIesmy2I5C08yPHLyeEYOt8qyS49UGnQ3KFLb93wO3PM
	 5BIhS30m/v2u+JHrk1WU3Bx18YiaJl88nm9pwpZ+Zb0EdzknCrT4EBv1+1VFN6QRDh
	 dNYfoj0PSa1oggkHGSKC2oHm6OC5jryBKQGBgb3g=
Date: Fri, 9 Jan 2026 10:34:35 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Steven Rostedt
 <rostedt@goodmis.org>, Dave Hansen <dave@sr71.net>, Dave Hansen
 <dave.hansen@intel.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, Dan
 Williams <dan.j.williams@intel.com>, NeilBrown <neilb@ownmail.net>,
 Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-Id: <20260109103435.cb555ad5374a50db413e3861@linux-foundation.org>
In-Reply-To: <aWDf1zlLTKmw9xnq@stanley.mountain>
References: <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
	<a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
	<85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
	<e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
	<a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
	<6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
	<f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
	<5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
	<20260108151437.3188cd53@gandalf.local.home>
	<cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>
	<aWDf1zlLTKmw9xnq@stanley.mountain>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Dan, thanks for taking care of this.

My overall not-strongly-held take is that we shouldn't try to be overly
proscriptive at this stage.  Wait and see if a problematic pattern
emerges and then deal with it.

But my main reason for weighing in: I haven't yet seen evidence that
the LLMs produce useful kernel changes, but AI is looking to be useful
at finding bugs.

If an AI-generated bug report comes in the form of a purported code fix
then it's "thanks for the bug report", delete the email then get in
and fix the issue in our usual way.

As we work through these issues, please let's not accidentally do
anything which impedes our ability to receive AI-generated bug reports.
If that means having to deal with poor fixes for those bugs then so be
it - the benefit of the bug report outweighs the cost of discarding the
purported fix.
