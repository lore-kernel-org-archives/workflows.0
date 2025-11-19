Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378BD26463A;
	Wed, 19 Nov 2025 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567322; cv=none; b=W0XFlEM35KEHJjtn5PzqDQIqFV4ejUGCX/oJBnOWXRGa12rsVJxyu/T6zXSX4ZvB08tDUw1/xpPfuVAyRwXab1jiXJ6SJIgZXbSVnnRH13F9MpuKunObi8EDt7Yenz0/VjvWBo0UtiDBmyiwyqWv9637W3SBUD+43l3Ih6/l1KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567322; c=relaxed/simple;
	bh=K82tFy6PhCbKFufaTvlWwkHMwVmC2ai0PRE4YCqQruE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRH0Wjq6UhQTLVa/Xdjno4Pj2OdIrD+xsXa4myKqM3Zozib8ezvR2KQccizdupYNsnnb8mI66NNifAuPArgxb91CCxdi8IuqOeG67/GwzJXhmxmOj21auDoWL6uwHRCCS1ucHQ+eyAqnsQ3QGNHETCQPGrMZ0uinKNk/es8Vafo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVNrM8Qw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVNrM8Qw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEFAC2BCB6;
	Wed, 19 Nov 2025 15:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763567321;
	bh=K82tFy6PhCbKFufaTvlWwkHMwVmC2ai0PRE4YCqQruE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sVNrM8QwoNqHYUp5MIxkcFNCFBe4fc6kWiaoDBhbPz+YkK9p35whlu+wLHWDf2RqR
	 Gito+mrFIYm9rTLCijuIXDjp08bgrCypeYqRpQL/H9ErYHmWTRfg1m70afdBU739hu
	 zDrKd69YYpxt4RfQBX1i0FmRTLeGaETV6dYdYzUH3dkEmFwa0oe5n6XuryE+UeDILw
	 l4NDLH/g7gSJWXEOHh/IPymdeOXRVrYhpwW6G73k+1hf52uK3rwO09MINLKevHc+bK
	 4pFTJoENrTHqgfbVQEG95ivn4vPhO3ivTPR9OyqBU9Kbj8LzXJRxeB0bkLarnD3lj7
	 hoPfmOJP+A+iw==
Date: Wed, 19 Nov 2025 10:48:37 -0500
From: Sasha Levin <sashal@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, josh@joshtriplett.org,
	kees@kernel.org, konstantin@linuxfoundation.org,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	workflows@vger.kernel.org, joe@perches.com, rdunlap@infradead.org
Subject: Re: [PATCH v4] README: restructure with role-based documentation and
 guidelines
Message-ID: <aR3m1YdtiylRf0Td@laps>
References: <20251119023832.1095490-1-sashal@kernel.org>
 <20251119084353.658db390@foz.lan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20251119084353.658db390@foz.lan>

On Wed, Nov 19, 2025 at 08:43:53AM +0100, Mauro Carvalho Chehab wrote:
>Em Tue, 18 Nov 2025 21:38:32 -0500
>Sasha Levin <sashal@kernel.org> escreveu:
>> +Quick Start
>> +-----------
>>
>> -    https://www.kernel.org/doc/html/latest/
>> +* Report a bug: See Documentation/admin-guide/reporting-issues.rst
>
>Perhaps you might add a link to Documentation/process/security-bugs.rst
>as well, although it is already there at reporting-issues.rst.

I prefer to leave it in the security researcher section below to keep the quick
start "quick" :)

>> +* Get the latest kernel: https://kernel.org
>> +* Build the kernel: See Documentation/admin-guide/quickly-build-trimmed-linux.rst
>> +* Join the community: https://lore.kernel.org/
>>
>> -There are various text files in the Documentation/ subdirectory,
>> -several of them using the reStructuredText markup notation.
>> +Essential Documentation
>> +-----------------------
>>
>> -Please read the Documentation/process/changes.rst file, as it contains the
>> -requirements for building and running the kernel, and information about
>> -the problems which may result by upgrading your kernel.
>> +All users should be familiar with:
>> +
>> +* Building requirements: Documentation/process/changes.rst
>> +* Code of Conduct: Documentation/process/code-of-conduct.rst
>> +* License: COPYING (GPLv2)
>
>Hmm... "GPLv2" doesn't fit all, as it is GPL-2.0 WITH Linux-syscall-note,
>plus, as stated on COPYING:

Heh, I wanted to avoid sounding too SPDX-y and stole it from
Documentation/process/1.Intro.rst:

	Code is contributed to the Linux kernel under a number of licenses, but
	all code must be compatible with version 2 of the GNU General Public License
	(GPLv2), which is the license covering the kernel distribution as a whole.

>As we don't want to repeat the entire COPYING text here, better
>to just point to the file, e.g.
>
>	License: see COPYING

This makes sense.

-- 
Thanks,
Sasha
