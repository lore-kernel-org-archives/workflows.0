Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62703A4F24;
	Tue, 20 Jan 2026 21:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946208; cv=none; b=UobbfbhCttftwUOtPcOaI3Nznlyu1Q8sz0P0+YQeMbY2lzotnhjmLAh0Ulr+RKZre8E3l1AAx9UQ8EoIh0j3TqITnUVPaEeRADGqpiIktg888xoznc+CHB6CHHNVAJ37ZyauzCdgF4q7fgxxjuTeETrexSu3aA0c9Hkb273qpa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946208; c=relaxed/simple;
	bh=FzMdzP56GstVKF3ZixDpDHYfJlLiP7DaiRtIzsPUWEo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gFFRECVhkunc419eV28P24MsM3XEJQJWnLeTbTB7M5GFaAW6Y+KLf0ce3DZr0BpZeVrUymtE8X7ntuHQhxVOMCaRgSwxit/3jPxTZnodYH0lQ4z6VIEelZbjmS3oC+TCemsIM3yEWb0B9nyVQJNqmJxUWWEvBZm1DF9SLue/g14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ILXJTjV6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ILXJTjV6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AFDFB40C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768946205; bh=FzMdzP56GstVKF3ZixDpDHYfJlLiP7DaiRtIzsPUWEo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ILXJTjV6WVHwCAaJbaVr5hmn9Ig2K/FElbm3cj3MR2ai1xd6MBPm1W2bEC4EEe/pL
	 gLZSEajMQMvp0tAXbmrx+skTYKI+fYr/6PaHLbdh9maXaiLlGj5CG8x6WZRm8BSJ0T
	 TpibuAa6Jxe1AiCeeiiMXgEBSdGK7yIRdo7WlfuP9l1NIM+xIlnVDwLLOSwEcLJ8ql
	 ctsE09YIy2th0RPGQ83JFzh8lFtfJbmO4x8J8fp6CW0j2rEQzUXmlKXrJrXT9x7DOt
	 1i+YWZ0TgcKPqqTsXpC+qe7cS9J/7sCeMrS6q/uiyco6ATiD7tU2JxfFdxOOInClWB
	 FW7Jobfyx2neg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AFDFB40C27;
	Tue, 20 Jan 2026 21:56:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, Dan
 Williams <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>,
 "Paul E . McKenney" <paulmck@kernel.org>, Simon Glass
 <simon.glass@canonical.com>, Lee Jones <lee@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, NeilBrown <neilb@ownmail.net>, Theodore Ts'o
 <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Vlastimil Babka
 <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v6] Documentation: Provide guidelines for
 tool-generated content
In-Reply-To: <20260119200418.89541-1-dave.hansen@linux.intel.com>
References: <20260119200418.89541-1-dave.hansen@linux.intel.com>
Date: Tue, 20 Jan 2026 14:56:44 -0700
Message-ID: <87cy34hrs3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dave Hansen <dave.hansen@linux.intel.com> writes:

> In the last few years, the capabilities of coding tools have exploded.
> As those capabilities have expanded, contributors and maintainers have
> more and more questions about how and when to apply those
> capabilities.
>
> Add new Documentation to guide contributors on how to best use kernel
> development tools, new and old.
>
> Note, though, there are fundamentally no new or unique rules in this
> new document. It clarifies expectations that the kernel community has
> had for many years. For example, researchers are already asked to
> disclose the tools they use to find issues by
> Documentation/process/researcher-guidelines.rst. This new document
> just reiterates existing best practices for development tooling.
>
> In short: Please show your work and make sure your contribution is
> easy to review.
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>

OK, it seems this is ready, so I've just applied it, thanks.

jon
