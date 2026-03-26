Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FFE341062;
	Thu, 26 Mar 2026 21:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774561001; cv=none; b=J+kEt5IjOJHeLjnW5y0FVeopANX57qA+wRdx8a6nHbpIqncs5zXS8V3fcm2bvTzEHyQVHQRhIWBLBTKZKXdrx12RUgJ1+N2GQHqHpQUUSnSHiwBBGKExDzJfLV8hT1kJGjmLFzk6v3EnLe6mBcqmKxuPB4AUbYoWXh5O4Dwt37E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774561001; c=relaxed/simple;
	bh=hPVD2JNdDnt72cvMdZmM18yx1DLlak7EtfFQpxVx3eI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZiPzlQDLItoh/sSFeHF29SFl1+0TS2pnofjsnMttPXaqyHmFRwuqvlnIgGeb7+2iDo4fOuGgb+5hWJ3XeSdLS39XUpVnlscMf710NoavqBIxT/bcJutOXJHz3nHXcitS5de5Ah/CS8ghT53Y3T+tcj8H4IYBsZ5WuQar9cPGRO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id B0799140EEE;
	Thu, 26 Mar 2026 21:36:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 0811220013;
	Thu, 26 Mar 2026 21:36:35 +0000 (UTC)
Message-ID: <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
From: Joe Perches <joe@perches.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, Jonathan
 Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 14:36:35 -0700
In-Reply-To: <acVIBseRrqJI8Uwb@google.com>
References: <acTPXMJfkHLeItrK@google.com>
	 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
	 <acVIBseRrqJI8Uwb@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: 4uf945ouepwu86tdj1quoz1f944nzo6k
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 0811220013
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX192fQjLjcPq+R8tEONL1nkPIhd+L18G+sk=
X-HE-Tag: 1774560995-230844
X-HE-Meta: U2FsdGVkX18WwagJdMthDN5+I4Vy5Af/CDUXC1ows7bSaHSyIYldDeWTFQECeEaW8Yj8zsIAZqw/l2T5TluQZTM9s67NAHP/FTUx415cDgAbKBy99nACjAY+gNbr8Uy1k2TPNH1I0tDQfkRIlrC2CHWQ0MqNfqYeNgrL7UGRbyPoFIJQk2mgEbSjdtESEn4tiH8+LKNah3Xm54kY+96a41oB9WuYib2F1u1S4aScSlql0nxntJzwXm1m7fmkeqarAk4WDW7j5FsqKbLd6wQWcmb3HNmoWjtbIKwcou7HAwSu3gf2ElRJPxhYnEnIUs/H

On Thu, 2026-03-26 at 07:53 -0700, Dmitry Torokhov wrote:
> On Thu, Mar 26, 2026 at 01:46:49AM -0700, Joe Perches wrote:
> On Wed, 2026-03-25 at 23:20 -0700, Dmitry Torokhov wrote:
> checkpatch does not handle full files well when they are passed on
> > > stdin, because it does not know how to treat the text, and whether it=
 is
> > > a C file, or a DTS file, or something else, and so it assumes that wh=
en
> > > it works with stdin it should be a unified diff. For full files it
> > > expects to have a file name as an argument and read the contents from
> > > disk. Unfortunately this does not well when trying to use checkpatch =
as
> > > an online linter and feed it contents of an editor buffer that have n=
ot
> > > made it to the disk yet.
> >=20
> > Why is this useful?
> > Why not save the buffer and then feed the file?
>=20
> Because when I am editing a file I am not saving it all that often. I
> want to have buffer diagnostic updated when I leave insert mode in vim.

I believe you are able to keep your own version of checkpatch.
