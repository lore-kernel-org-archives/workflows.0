Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5E244AB6F;
	Tue, 28 Jul 2026 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249106; cv=none; b=felYMJr+f5HSUkEOE/PF9qBXBl2ilz3l84wZW1RA+O8R8xMbqgY8x1eAaXJkyZtxi5SlwNIKSfgFR12+M4CS49BBPFWeGoak+Y8aDWCRSUpBjZMyj6umN7xQWAdO5M22+Oo5/29SEtXzAoDd9vUwjW6ax55odD8mXFXM2nuqrkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249106; c=relaxed/simple;
	bh=89up8mUdYvTK+igARs8aRUFnAJj4Z0KW1RwJaKArAGs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g6OOp0lMA7SS50mE8aYeETVl0qvwGF6vQT4I1Si5R10brk6cau5+Wz328ehAAAS1NcNieWSbu/AQCTGiNVh1Vc+9+tUJtm+/bNBAcjc10K6JIapqWjgVQXwqnlup0/7qytw8DZxB2Eke8zSEEZQrGqiWDqjAuMZwDl4oxuC+F6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWoOdEnG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWoOdEnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F29E1F000E9;
	Tue, 28 Jul 2026 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249104;
	bh=1I0A0KHMT3p94wcrQyYD7I2apFHj3Ffh0hBwQTCY6NU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EWoOdEnGLjWpztvc0slF/CM9qNmGJZmWPNQ7WqhHO9Ezz+EvqmRKmhrCB4v6zQN9X
	 JeZeS4jmsdKtWbr1Pk+gT503WfiysYXC8AYQGi/LwGQ8Ryzaj0anZtjuwunOJ/XLtm
	 MJ4ehzRYM/MFDis3fYGC6TDNOEJMAhnCmUpjeHLxmXFD1U0hWHQLe19EJf4VvaH3Hr
	 CedSwTba9Ljofw5kmsX902e/fg4pRXdcbW1acMQ4kiWYKNqV17cfYycIWJiwTP4bLa
	 LH3HMPPiZUyWlKpcB8SZCpruHM7vJtgd8yMkIki/ZYqnI8fs9JUu15oIFAgPz5d+9j
	 IwA9LenJ+Tx1Q==
Date: Tue, 28 Jul 2026 07:31:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Cihan Karadag <cihan.cihan@gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] checkpatch: warn about possible missing gitignore
 coverage in selftests
Message-ID: <20260728073143.0e665e36@kernel.org>
In-Reply-To: <20260728052442.626076-1-cihan.cihan@gmail.com>
References: <20260728052442.626076-1-cihan.cihan@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Jul 2026 23:24:41 -0600 Cihan Karadag wrote:
> Per selftests documentation [1], every generated test binary must be
> added to gitignore to prevent leaving untracked files in the kernel
> tree.
> 
> This is an easy mistake to make when adding a new test. In fact, a
> search of selftests history turns up dozens of standalone follow-up
> patches with titles like "add missing gitignore for <binary>", each
> needed only because the original patch adding a new test
> didn't also update gitignore.
> 
> Add a SELFTESTS_GITIGNORE check that warns about gitignore coverage
> whenever a patch adds a new file under tools/testing/selftests/, the
> same way FILE_PATH_CHANGES warns about MAINTAINERS on any added,
> moved, or deleted file.

What percentage of changes to selftests from last 2 releases will
false-positive trigger this? Would be good to know, checkpatch has
a tendency of generating false positives which is quite counter
productive. In netdev CI at least we build the selftests and check
if there are any untracked files after.
