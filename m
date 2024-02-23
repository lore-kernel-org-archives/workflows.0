Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6195C12836E
	for <workflows@vger.kernel.org>; Fri, 23 Feb 2024 16:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705915; cv=none; b=rRufIpDi0iLWKN08evP6IqcKG2fgYouV/1tmTRVZoXXpivFzPnjxhMwDnB3xziX57NK50e4S+6lCQYQJyCx9vrPFAKyNzr1C4FPGK8WwGSYl7hyxnnIxt3N6a1DJJ7AeyF6k/IXpEolHJrNkv4NGhEOJVq3GqZRKanlE3CH7FJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705915; c=relaxed/simple;
	bh=8LJv+IQf4U69TqtlPTCzcrCxeNEPwMUxok3pYERgHHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V3Eun8fTqW+twgaf9TM8s9iMU+T1Y/95FcmNdD7HvsHWunf9KVoWE1xhjQdZ443IYUb/tZdYPTszsVkFQtxiZbsAQi30P2GDT2Wgr0jdZzEGchHZB5CS9s4pm0C4hDk7h63DM+A2++mfchDK8oqqG/8VUkiYMiXP5YzBP+kRObw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0DBJGcC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0DBJGcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134C6C433C7;
	Fri, 23 Feb 2024 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708705915;
	bh=8LJv+IQf4U69TqtlPTCzcrCxeNEPwMUxok3pYERgHHk=;
	h=Date:From:To:Cc:Subject:From;
	b=A0DBJGcCJwiWH9I8XO89rVMy5w5aZxB2iM+fwXWB2lrnsx+uG6kTfbc9Cx8Qt7cyC
	 +RDxHh1mokDDOOfzKg8COGn9WES2dE+6KgPXdCWLQjFOmhQhvZrdQf6soKPQINgX9T
	 w05rh9iBCcvN6MehVakVQmPbl0ZJQkgVW3Ow4gIDzYflNEei9svupDjyZNiZSU+l3U
	 c7deqcJPgBjl2RPwXw9fslE5vIuqDcl4YoxxXxw5oRm3W9fEhzYMPXmtduhXi4TdJD
	 lQfgj1d6EMwPowBsr8953CKgo0rXfds01l7szpCuDRo/Fe+O+X3Fs9o8EivX1kj8K1
	 jH2qhyWLfLYSg==
Date: Fri, 23 Feb 2024 08:31:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: workflows@vger.kernel.org, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: corbet@lwn.net, ast@kernel.org
Subject: Simple analytics for docs.kernel.org and patchwork, please?
Message-ID: <20240223083154.4fbee63c@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi!

We have a few netdev-related bots with various simple status pages.
I hooked them up to analytics recently, here's the dash:
https://plausible.io/netdev.bots.linux.dev

Plausible was described here: https://lwn.net/Articles/822568/
it's supposedly-open, and privacy-focused, no cookies etc.

It's useful for me when deciding where to invest my time,
and to back up the efforts to my employer with some data.

Now, most of us agree that kernel docs leave something to be desired.
At the same time maintainers are repeatedly faced with people who post
code without reading the docs, which puts the time invested in writing
them into question. I can't help but think that providing some
analytics for docs.kernel.org traffic would be beneficial. 
I would use it.

Thoughts?

Does anyone think that even non-intrusive analytics are a no go?

Does anyone know better alternatives than Plausible?
