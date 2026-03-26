Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954E925776;
	Thu, 26 Mar 2026 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514815; cv=none; b=c9YvvYwjAuzSgIimfazumVdYpbjzPVP3QZuKcWbPm+p2A/B/eaZYg5EDyChAPv/PUWHSlUeNg5N5y4R6ECfz3KDcad6LZXHMyuo6ivQvWT3E1APMvvYYj8gQMmCxbDyFpIPhTq0IHzASJMe78F5pFEPyjXBO4FdA1R92pHiXFWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514815; c=relaxed/simple;
	bh=28x2Z0y5SxzWoHFh4GPWVrmyi25ie2jkjgA/cpSn3Ug=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AKeeFx5ChdWeaw7FvWFjL9JK+m3g2SKDbCy69AmHC0ZUH2UlZ+qjPlTQWKtC96HvyTxbJCMP5DqhVqb120CvyH+4kBpMKESncMmh+jNgT3kkKfj5L/gg4SbE9mg7tTuFCi2d30gM+Tv46UVJgM5H3L0AljcNPdeFJP9urirHKA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id E409F5B8E5;
	Thu, 26 Mar 2026 08:46:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 569241A;
	Thu, 26 Mar 2026 08:46:50 +0000 (UTC)
Message-ID: <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
From: Joe Perches <joe@perches.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Dwaipayan Ray
	 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andy
 Whitcroft <apw@canonical.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, 	workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 01:46:49 -0700
In-Reply-To: <acTPXMJfkHLeItrK@google.com>
References: <acTPXMJfkHLeItrK@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: 8w5r5dxhuxow4x46zrht5ni4tefh1reg
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 569241A
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+rWZ2HbPnD9UiQsnSJ0r0hgNGXqzpa9WY=
X-HE-Tag: 1774514810-249581
X-HE-Meta: U2FsdGVkX1/xQ+Tt5ghHWe4IuwPyO7C8y1CBlDSnpUm+JkgbX3+t/A6xiffKjVA3pij619aBbf6P3UW1xFKIkYIM9BDrvKZSehQscw4RKdwx6ytbP2QMVi06+IpzxpYht7uNYk9R1F1zuUmJ85sYUckfyfkdBIfE+FBb/OIdaeszAyZY2eaeoK9jbFhWUHUaF/nmL93xtXl/F1XOIZzG9w+w6KkQSxOm0mprYwavYfUb1vcY2AQqPg6MS8NI7XJRXixbUtNZ/rTS48Hz7WutcL64sz/B+IAKpzPVNM8v3eFTxLEcowvR2ESuzAwbAeVo

On Wed, 2026-03-25 at 23:20 -0700, Dmitry Torokhov wrote:
> checkpatch does not handle full files well when they are passed on
> stdin, because it does not know how to treat the text, and whether it is
> a C file, or a DTS file, or something else, and so it assumes that when
> it works with stdin it should be a unified diff. For full files it
> expects to have a file name as an argument and read the contents from
> disk. Unfortunately this does not well when trying to use checkpatch as
> an online linter and feed it contents of an editor buffer that have not
> made it to the disk yet.

Why is this useful?
Why not save the buffer and then feed the file?
