Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63FD25776;
	Thu, 26 Mar 2026 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774565794; cv=none; b=kZLSWKSE3gnE/QTuSEUhobiSMw3cYgKvtaSjJIZgXJwlI9EqNfI2HMDBpkwBrwyADcKpSi59jVyNX6X9zubPRc+dKPuNiOkZ3XlfqG9LGHpAVoPhflt+rUGkYxCFv4qCalkZptTUNNCSWKtH8f+RhZ9lcNVKuWEJ5Yu9Gktcfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774565794; c=relaxed/simple;
	bh=72EKfGGi+Z9MGVMyBYh4IjtJLRu+H7K5JVyi/aWQHvE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DqcdZ1K6KvMeKHsMOZFt8bfklyA8TUGlcN+YiB5FtliNyQWWmHxCsJheJESYVfP8x49Yr2GGurhv3PFjkqe8N6mKfD3iYzmoVuddzUjrN4BjVdSrVkVYmoUaA2vWx442e9bqj7xKUrwDFACGsH5EiccUKOFc5M5ygD7mPopTdi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id B6253BD2A7;
	Thu, 26 Mar 2026 22:56:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 029FB17;
	Thu, 26 Mar 2026 22:56:27 +0000 (UTC)
Message-ID: <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
From: Joe Perches <joe@perches.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, Jonathan
 Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 15:56:27 -0700
In-Reply-To: <acWnbG3nGjfYeYXh@google.com>
References: <acTPXMJfkHLeItrK@google.com>
	 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
	 <acVIBseRrqJI8Uwb@google.com>
	 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
	 <acWnbG3nGjfYeYXh@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 029FB17
X-Stat-Signature: ikgjjuxs8nrd168jsp6cx1q4m8gpp7ha
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+/Ny20A76RkOGaknaAmFtavrWk/tKo/ZY=
X-HE-Tag: 1774565787-261062
X-HE-Meta: U2FsdGVkX197hr39B9QuZBXHrREZ/y4EWpeSo1uBh/35OcP1LCNM6/+UWFc6KjqvAhTTdDPIdrdWjWDpWjYNJEuejpAi0Y5xm52r2XpZ4ZPGyuT6/Lm20c5omLiSB0goiTeh0OhgfCDxpjCAZq3Mdk04vQPaEH6Nk/ZoiVGNjy76CuPlUsm8KI5jjx7XP37MWaTyKAAtqIjpvChNTRqsIr23irwv7yCut4Xu5foF9nKT7C5bZzBNkEnE22ngeDK/c8ncd+0XmrJf8iKlHCMiYkqa07C768QQtrWUalnQDKlg79wtgpQqNORGlig817m3

On Thu, 2026-03-26 at 14:42 -0700, Dmitry Torokhov wrote:
> > > Because when I am editing a file I am not saving it all that often. I
> > > want to have buffer diagnostic updated when I leave insert mode in vi=
m.
> >=20
> > I believe you are able to keep your own version of checkpatch.
>=20
> As well as my version of the kernel, gcc, clang, editor, git and so on.
>=20
> Do you have any constructive feedback?

I gave you feedback.  You elided it.

> Right now checkpatch is broken
> when using "-f" with stdin and I offer a fix. If you have a better way
> in mind by all means share it.

Note the name.  Feed it a patch.  It works fine.  It's not broken.
